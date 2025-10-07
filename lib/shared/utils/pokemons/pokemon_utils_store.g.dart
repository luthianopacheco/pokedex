// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_utils_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonTypeStore on PokemonUtilsStoreBase, Store {
  late final _$typesAtom =
      Atom(name: 'PokemonUtilsStoreBase.types', context: context);

  @override
  ObservableList<PokemonType> get types {
    _$typesAtom.reportRead();
    return super.types;
  }

  @override
  set types(ObservableList<PokemonType> value) {
    _$typesAtom.reportWrite(value, super.types, () {
      super.types = value;
    });
  }

  late final _$loadTypesAsyncAction =
      AsyncAction('PokemonUtilsStoreBase.loadTypes', context: context);

  @override
  Future<void> loadTypes() {
    return _$loadTypesAsyncAction.run(() => super.loadTypes());
  }

  @override
  String toString() {
    return '''
types: ${types}
    ''';
  }
}
