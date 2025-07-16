import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/models/order_options.dart';
import 'package:pokedex/features/home/models/pokemon_basics.dart';
import 'package:pokedex/features/home/models/pokemon_type.dart';
import 'package:pokedex/features/home/services/pokemon_cache_service.dart';

@lazySingleton
class PokemonRepository {
  final _dio = Dio();
  final _apiUrl = 'https://pokeapi.co/api/v2';
  final PokemonCacheService _cache;

  PokemonRepository(this._cache);

  /// Busca lista de pokémons com nome e url e salva em cache
  Future<void> getAndCachePokemonBasics() async {
    try {
      final response = await _dio.get("$_apiUrl/pokemon?limit=10000");
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

  /// Busca na API dados faltantes em cache: tipos e imagem
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

  /// Busca pokémons pela lista de ID
  Future<List<PokemonBasics>> getPokemonsByIdsFromCache(List<int> ids) async {
    try {
      final cached = await _cache.getAll();
      final map = {for (var p in cached) p.id: p};

      return ids.map((id) => map[id]).whereType<PokemonBasics>().toList();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao buscar Pokémons por IDs');
    }
  }

  /// Carrega as opções de tipos de pokémons dos assets
  Future<List<PokemonType>> loadTypeFilterOptions() async {
    try {
      final path = 'assets/data/pokemon_types.json';
      final data = await rootBundle.loadString(path);
      final jsonResult = json.decode(data) as List<dynamic>;

      return jsonResult.map((e) => PokemonType.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao carregar filtro: tipos');
    }
  }

  /// Carrega as opções de ordenação de pokémons dos assets
  Future<List<OrderOptions>> loadOrderFilterOptions() async {
    try {
      final path = 'assets/data/order_options.json';
      final data = await rootBundle.loadString(path);
      final jsonResult = json.decode(data) as List<dynamic>;

      return jsonResult.map((e) => OrderOptions.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao carregar filtro: ordenação');
    }
  }

  Future<List<String>> getPokemonNamesByType(String typeName) async {
    try {
      final response = await Dio().get('$_apiUrl/type/$typeName');
      final data = response.data['pokemon'] as List<dynamic>;

      return data.map((e) => e['pokemon']['name'] as String).toList();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao buscar pokémons por tipo');
    }
  }

  /// Busca os pokémons em cache a serem exibidos considerando o campo de pesquisa e filtros
  Future<List<int>> getFilteredPokemonIds({
    String? search,
    String? type,
    String? order,
    List<String>? namesOnly,
  }) async {
    try {
      final cached = await _cache.getAll();
      List<PokemonBasics> result = cached;

      if (namesOnly != null && namesOnly.isNotEmpty) {
        result = result.where((p) => namesOnly.contains(p.name)).toList();
      }

      if (search != null && search.trim().isNotEmpty) {
        final s = search.trim().toLowerCase();

        result = result.where((p) {
          final name = p.name.toLowerCase();
          final id = p.id.toString();

          return name.contains(s) || id.contains(s);
        }).toList();
      }

      if ((namesOnly == null || namesOnly.isEmpty) &&
          type != null &&
          type != 'all') {
        result = result
            .where((p) => p.types?.any((t) => t == type) ?? false)
            .toList();
      }

      switch (order) {
        case 'number-asc':
          result.sort((a, b) => a.id.compareTo(b.id));
          break;
        case 'number-desc':
          result.sort((a, b) => b.id.compareTo(a.id));
          break;
        case 'name-asc':
          result.sort((a, b) => a.name.compareTo(b.name));
          break;
        case 'name-desc':
          result.sort((a, b) => b.name.compareTo(a.name));
          break;
        default:
          break;
      }

      return result.map((e) => e.id).toList();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao carregar Pokémons filtrados');
    }
  }
}
