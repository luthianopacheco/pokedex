import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/models/pokemon.dart';

@lazySingleton
class PokemonRepository {
  final _dio = Dio();
  final _apiUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<Pokemon>> getPokemons({required int length}) async {
    try {
      final response = await _dio.get("$_apiUrl?offset=$length&limit=20");
      final data = response.data['results'] as List<dynamic>;

      final List<Future<Pokemon>> reqs = data.map((result) async {
        final res = await _dio.get(result['url']);
        return Pokemon.fromJson(res.data);
      }).toList();

      final pokemons = await Future.wait(reqs);
      return pokemons;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao buscar Pokémons');
    }
  }
}
