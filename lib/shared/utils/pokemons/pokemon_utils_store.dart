import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/features/home/domain/models/pokemon_type.dart';
import 'package:pokedex/shared/domain/repositories/i_type_repository.dart';

part 'pokemon_utils_store.g.dart';

@LazySingleton()
class PokemonTypeStore = PokemonUtilsStoreBase with _$PokemonTypeStore;

abstract class PokemonUtilsStoreBase with Store {
  final ITypeRepository _repository;
  PokemonUtilsStoreBase(this._repository);

  @observable
  ObservableList<PokemonType> types = ObservableList<PokemonType>();

  @action
  Future<void> loadTypes() async {
    if (types.isNotEmpty) return;

    try {
      final loadedTypes = await _repository.loadTypeOptions();
      types.addAll(loadedTypes);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
