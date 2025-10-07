// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonDetailsStore on PokemonDetailsStoreBase, Store {
  late final _$pokemonAtom =
      Atom(name: 'PokemonDetailsStoreBase.pokemon', context: context);

  @override
  PokemonData? get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(PokemonData? value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  late final _$evolutionChainAtom =
      Atom(name: 'PokemonDetailsStoreBase.evolutionChain', context: context);

  @override
  EvolutionChain? get evolutionChain {
    _$evolutionChainAtom.reportRead();
    return super.evolutionChain;
  }

  @override
  set evolutionChain(EvolutionChain? value) {
    _$evolutionChainAtom.reportWrite(value, super.evolutionChain, () {
      super.evolutionChain = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'PokemonDetailsStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$PokemonDetailsStoreBaseActionController =
      ActionController(name: 'PokemonDetailsStoreBase', context: context);

  @override
  void setPokemon(PokemonData value) {
    final _$actionInfo = _$PokemonDetailsStoreBaseActionController.startAction(
        name: 'PokemonDetailsStoreBase.setPokemon');
    try {
      return super.setPokemon(value);
    } finally {
      _$PokemonDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEvolutionChain(EvolutionChain value) {
    final _$actionInfo = _$PokemonDetailsStoreBaseActionController.startAction(
        name: 'PokemonDetailsStoreBase.setEvolutionChain');
    try {
      return super.setEvolutionChain(value);
    } finally {
      _$PokemonDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$PokemonDetailsStoreBaseActionController.startAction(
        name: 'PokemonDetailsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$PokemonDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemon: ${pokemon},
evolutionChain: ${evolutionChain},
isLoading: ${isLoading}
    ''';
  }
}
