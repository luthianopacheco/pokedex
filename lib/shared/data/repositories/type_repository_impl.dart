import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/domain/models/pokemon_type.dart';
import 'package:pokedex/features/home/data/models/pokemon_type_data.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/shared/domain/repositories/i_type_repository.dart';

@LazySingleton(as: ITypeRepository)
class TypeRepositoryImpl implements ITypeRepository {

  @override
  Future<List<PokemonType>> loadTypeOptions() async {
    try {
      final path = Assets.data.pokemonTypes;
      final data = await rootBundle.loadString(path);
      final jsonResult = json.decode(data) as List<dynamic>;

      final dataList = jsonResult
          .map((e) => PokemonTypeData.fromJson(e))
          .toList();

      return dataList.map((data) => data.toDomain()).toList();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao carregar tipos de Pokémon.');
    }
  }
}