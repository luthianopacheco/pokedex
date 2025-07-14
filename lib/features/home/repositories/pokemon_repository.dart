import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/models/pokemon_basics.dart';
import 'package:pokedex/features/home/services/pokemon_cache_service.dart';

@lazySingleton
class PokemonRepository {
  final _dio = Dio();
  final _apiUrl = 'https://pokeapi.co/api/v2/pokemon';
  final PokemonCacheService _cache;

  PokemonRepository(this._cache);

  Future<void> getAndCachePokemonBasics() async {
    try {
      final response = await _dio.get("$_apiUrl?limit=10000");
      final data = response.data['results'] as List<dynamic>;

      for (var item in data) {
        final basic = PokemonBasics.fromJson(item);

        final existingCache = await _cache.getById(basic.id);
        if (existingCache == null) {
          await _cache.save(basic);
        }
      }

      debugPrint('Pokémons em cache: ${(await _cache.getAll()).length}}');
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao buscar lista de Pokémons');
    }
  }

  Future<List<PokemonBasics>> getAllFromCache() async {
    try {
      final all = await _cache.getAll();
      all.sort((a, b) => a.id.compareTo(b.id));
      return all;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao buscar todos Pokémons em cache');
    }
  }

  Future<List<PokemonBasics>> getPaginatedPokemonsFromCache({
    required int offset,
    required int limit,
  }) async {
    try {
      final entries = await _cache.getFetchedOrderedById();
      return entries.skip(offset).take(limit).toList();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao buscar Pokémons em cache');
    }
  }

  Future<void> getAndCacheMissingDetails(List<PokemonBasics> list) async {
    for (var entry in list.where((e) => !e.isFetched)) {
      try {
        final response = await _dio.get(entry.url);
        final updated = entry.copyWith(response.data);
        await _cache.save(updated);
      } catch (_) {
        continue;
      }
    }
  }

  Future<List<PokemonBasics>> getPokemonsByIdsFromCache(List<int> ids) async {
    try {
      final all = await _cache.getFetchedOrderedById();
      return all.where((e) => ids.contains(e.id)).toList();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao buscar Pokémons por IDs');
    }
  }
}
