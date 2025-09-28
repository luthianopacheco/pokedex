import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/pokemon_details/models/evolution.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/features/home/services/pokemon_cache_service.dart';
import 'package:pokedex/features/pokemon_details/models/evolution_chain.dart';
import 'package:pokedex/features/pokemon_details/models/pokemon_with_evolutions.dart';
import 'package:pokedex/features/pokemon_details/services/evolutions_cache_service.dart';

@lazySingleton
class PokemonDetailsRepository {
  final _dio = Dio();
  final _apiUrl = 'https://pokeapi.co/api/v2';
  final PokemonCacheService _pokemonCache;
  final EvolutionChainCacheService _evolutionCache;

  PokemonDetailsRepository(this._pokemonCache, this._evolutionCache);

  Future<PokemonWithEvolutions> getAndCachePokemonDetails({
    required int id,
  }) async {
    try {
      var pokemon = await _pokemonCache.getById(id);

      if (pokemon == null) {
        throw Exception("Pokemon $id não encontrado no cache básico");
      }

      EvolutionChain? chain;

      if (!pokemon.isDetailsFetched) {
        final speciesResponse = await _dio.get("$_apiUrl/pokemon-species/$id");
        final speciesData = speciesResponse.data;

        final firstType = pokemon.types?.first;
        Map<String, dynamic> typeData = {};
        if (firstType != null) {
          final typeResponse = await _dio.get("$_apiUrl/type/$firstType");
          typeData = typeResponse.data;
        }

        pokemon = pokemon.copyWithDetails(
          speciesJson: speciesData,
          typeJson: typeData,
        );

        await _pokemonCache.save(pokemon);
      }

      if (pokemon.chainId != null) {
        chain = await _evolutionCache.getById(pokemon.chainId!);

        if (chain == null) {
          final evolutionResponse = await _dio.get(
            "$_apiUrl/evolution-chain/${pokemon.chainId}",
          );
          final evolutionData = evolutionResponse.data;

          chain = EvolutionChain.fromJson(evolutionData);

          chain = await _fillEvolutionDetails(chain);

          await _evolutionCache.save(chain);
        } else {
          chain = await _fillEvolutionDetails(chain);
          await _evolutionCache.save(chain);
        }
      }

      return PokemonWithEvolutions(pokemon: pokemon, evolutionChain: chain);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao buscar lista de Pokémons');
    }
  }

  Future<EvolutionChain> _fillEvolutionDetails(EvolutionChain chain) async {
    final updatedEvolutions = <Evolution>[];

    for (final evolution in chain.evolutions) {
      if (!evolution.isComplete) {
        try {
          final cached = await _pokemonCache.getById(evolution.id);
          if (cached != null && cached.isBasicFetched) {
            updatedEvolutions.add(
              Evolution(
                id: evolution.id,
                name: evolution.name,
                minLevel: evolution.minLevel,
                url: evolution.url,
                imageUrl: cached.imageUrl,
                types: cached.types?.map((t) => t.toLowerCase()).toList(),
              ),
            );
            continue;
          }

          final response = await _dio.get("$_apiUrl/pokemon/${evolution.id}");
          final data = response.data;

          final updatedPokemon =
              cached?.copyWithBasics(data) ?? Pokemon.fromJson(data);

          updatedEvolutions.add(
            Evolution(
              id: evolution.id,
              name: evolution.name,
              minLevel: evolution.minLevel,
              url: evolution.url,
              imageUrl: updatedPokemon.imageUrl,
              types: updatedPokemon.types,
            ),
          );

          await _pokemonCache.save(updatedPokemon);
        } catch (_) {
          updatedEvolutions.add(evolution);
        }
      } else {
        updatedEvolutions.add(evolution);
      }
    }

    return EvolutionChain(id: chain.id, evolutions: updatedEvolutions);
  }
}
