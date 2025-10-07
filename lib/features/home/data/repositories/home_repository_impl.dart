import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/data/models/order_options_data.dart';
import 'package:pokedex/features/home/domain/models/order_options.dart';
import 'package:pokedex/features/home/domain/repositories/i_home_repository.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/shared/data/models/pokemon_data.dart';
import 'package:pokedex/core/services/pokemon_cache_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/shared/domain/models/pokemon.dart';

@LazySingleton(as: IHomeRepository)
class HomeRepositoryImpl implements IHomeRepository {
  final Dio _dio;
  final PokemonCacheService _cache;
  HomeRepositoryImpl(this._cache, this._dio);

  /// Busca lista de pokémons com nome e url e salva em cache
  @override
  Future<void> getAndCachePokemonBasics() async {
    try {
      final response = await _dio.get('pokemon?limit=10000');
      final data = response.data['results'] as List<dynamic>;

      for (var item in data) {
        final basic = PokemonData.fromJson(item);

        final existingCache = await _cache.getById(basic.id);
        if (existingCache == null) {
          await _cache.save(basic);
        }
      }

      debugPrint('Pokémons em cache: ${(await _cache.getAll()).length}}');
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(
        'Erro ao buscar lista de Pokémons.\nTente novamente mais tarde!',
      );
    }
  }

  Future<List<PokemonData>> getAllFromCache() async {
    try {
      final all = await _cache.getAll();
      all.sort((a, b) => a.id.compareTo(b.id));
      return all;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao buscar todos os Pokémons em cache');
    }
  }

  /// Busca na API dados faltantes em cache: tipos e imagem
  @override
  Future<void> getAndCacheMissingDetails(List<Pokemon> list) async {
    final listData = list.map((p) => p.toData()).toList();

    final needDetails = listData.where((e) => !e.isBasicFetched).toList();
    if (needDetails.isEmpty) return;

    for (var entry in needDetails) {
      try {
        final response = await _dio.get(entry.url);
        final updated = entry.copyWithBasics(response.data);
        await _cache.save(updated);
      } catch (e) {
        if (e is DioException && e.type == DioExceptionType.connectionError) {
          throw Exception(
            'Sem conexão com a internet.\nConecte-se e tente novamente!',
          );
        }
        continue;
      }
    }
  }

  /// Busca pokémons pela lista de ID
  @override
  Future<List<Pokemon>> getPokemonsByIdsFromCache(List<int> ids) async {
    try {
      final cachedDataList = await _cache.getAll();
      final map = {for (var p in cachedDataList) p.id: p};

      final resultData = ids
          .map((id) => map[id])
          .whereType<PokemonData>()
          .toList();

      return resultData.map((data) => data.toDomain()).toList();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao buscar Pokémons por IDs');
    }
  }

  /// Carrega as opções de ordenação de pokémons dos assets
  @override
  Future<List<OrderOptions>> loadOrderFilterOptions() async {
    try {
      final path = Assets.data.orderOptions;
      final data = await rootBundle.loadString(path);
      final jsonResult = json.decode(data) as List<dynamic>;

      final resultData = jsonResult
          .map((e) => OrderOptionsData.fromJson(e))
          .toList();
      return resultData.map((data) => data.toDomain()).toList();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao carregar filtro: Ordenação');
    }
  }

  @override
  Future<List<String>> getPokemonNamesByType(String typeName) async {
    try {
      final response = await _dio.get('type/$typeName');
      final data = response.data['pokemon'] as List<dynamic>;

      return data.map((e) => e['pokemon']['name'] as String).toList();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao buscar pokémons por tipo');
    }
  }

  /// Busca os pokémons em cache a serem exibidos considerando o campo de pesquisa e filtros
  @override
  Future<List<int>> getFilteredPokemonIds({
    String? search,
    String? type,
    String? order,
    List<String>? namesOnly,
  }) async {
    try {
      final cached = await _cache.getAll();
      List<PokemonData> result = cached;

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
      throw Exception(
        'Erro ao carregar Pokémons filtrados.\nTente novamente mais tarde!',
      );
    }
  }
}
