import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/services/pokemon_cache_service.dart';
import 'package:pokedex/features/pokemon_details/data/models/evolution_data.dart';
import 'package:pokedex/features/pokemon_details/data/models/evolution_chain_data.dart';
import 'package:pokedex/features/pokemon_details/domain/repositories/i_pokemon_details_repository.dart';
import 'package:pokedex/features/pokemon_details/domain/models/pokemon_with_evolutions.dart';
import 'package:pokedex/features/pokemon_details/data/datasources/evolutions_cache_service.dart';
import 'package:pokedex/shared/data/models/pokemon_data.dart';

@LazySingleton(as: IPokemonDetailsRepository)
class PokemonDetailsRepositoryImpl implements IPokemonDetailsRepository {
  final Dio _dio;
  final PokemonCacheService _pokemonCache;
  final EvolutionChainCacheService _evolutionCache;

  PokemonDetailsRepositoryImpl(
    this._pokemonCache,
    this._evolutionCache,
    this._dio,
  );

  @override
  Future<PokemonWithEvolutions> getAndCachePokemonDetails({
    required int id,
  }) async {
    try {
      var pokemon = await _pokemonCache.getById(id);

      if (pokemon == null) {
        throw Exception("Pokemon $id não encontrado no cache básico");
      }

      EvolutionChainData? chain;

      if (!pokemon.isDetailsFetched) {
        final speciesResponse = await _dio.get("pokemon-species/$id");
        final speciesData = speciesResponse.data;

        final firstType = pokemon.types?.first;
        Map<String, dynamic> typeData = {};
        if (firstType != null) {
          final typeResponse = await _dio.get("type/$firstType");
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
            "evolution-chain/${pokemon.chainId}",
          );
          final evolutionData = evolutionResponse.data;

          chain = EvolutionChainData.fromJson(evolutionData);

          chain = await _fillEvolutionDetails(chain);

          await _evolutionCache.save(chain);
        } else {
          chain = await _fillEvolutionDetails(chain);
          await _evolutionCache.save(chain);
        }
      }

      final domainChain = chain?.toDomain();

      return PokemonWithEvolutions(
        pokemon: pokemon,
        evolutionChain: domainChain,
      );
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao buscar lista de Pokémons');
    }
  }

  Future<EvolutionChainData> _fillEvolutionDetails(
    EvolutionChainData chain,
  ) async {
    final updatedEvolutions = <EvolutionData>[];

    for (final evolution in chain.evolutions) {
      if (!evolution.isComplete) {
        try {
          final cached = await _pokemonCache.getById(evolution.id);
          if (cached != null && cached.isBasicFetched) {
            updatedEvolutions.add(
              EvolutionData(
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

          final response = await _dio.get("pokemon/${evolution.id}");
          final data = response.data;

          final updatedPokemon =
              cached?.copyWithBasics(data) ?? PokemonData.fromJson(data);

          updatedEvolutions.add(
            EvolutionData(
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

    return EvolutionChainData(id: chain.id, evolutions: updatedEvolutions);
  }
}
