// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonDetailsController on PokemonDetailsControllerBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: 'PokemonDetailsControllerBase.hasError'))
          .value;

  late final _$pokemonAtom =
      Atom(name: 'PokemonDetailsControllerBase.pokemon', context: context);

  @override
  Pokemon? get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(Pokemon? value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  late final _$evolutionChainAtom = Atom(
      name: 'PokemonDetailsControllerBase.evolutionChain', context: context);

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
      Atom(name: 'PokemonDetailsControllerBase.isLoading', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: 'PokemonDetailsControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$getPokemonDetailsAsyncAction = AsyncAction(
      'PokemonDetailsControllerBase.getPokemonDetails',
      context: context);

  @override
  Future<void> getPokemonDetails({required int id}) {
    return _$getPokemonDetailsAsyncAction
        .run(() => super.getPokemonDetails(id: id));
  }

  late final _$PokemonDetailsControllerBaseActionController =
      ActionController(name: 'PokemonDetailsControllerBase', context: context);

  @override
  void clearError() {
    final _$actionInfo = _$PokemonDetailsControllerBaseActionController
        .startAction(name: 'PokemonDetailsControllerBase.clearError');
    try {
      return super.clearError();
    } finally {
      _$PokemonDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemon: ${pokemon},
evolutionChain: ${evolutionChain},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
hasError: ${hasError}
    ''';
  }
}
