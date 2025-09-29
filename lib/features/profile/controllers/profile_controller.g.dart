// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileController on ProfileControllerBase, Store {
  late final _$enableMegaEvolutionsAtom = Atom(
      name: 'ProfileControllerBase.enableMegaEvolutions', context: context);

  @override
  bool get enableMegaEvolutions {
    _$enableMegaEvolutionsAtom.reportRead();
    return super.enableMegaEvolutions;
  }

  @override
  set enableMegaEvolutions(bool value) {
    _$enableMegaEvolutionsAtom.reportWrite(value, super.enableMegaEvolutions,
        () {
      super.enableMegaEvolutions = value;
    });
  }

  late final _$enableOtherFormsAtom =
      Atom(name: 'ProfileControllerBase.enableOtherForms', context: context);

  @override
  bool get enableOtherForms {
    _$enableOtherFormsAtom.reportRead();
    return super.enableOtherForms;
  }

  @override
  set enableOtherForms(bool value) {
    _$enableOtherFormsAtom.reportWrite(value, super.enableOtherForms, () {
      super.enableOtherForms = value;
    });
  }

  late final _$notifyPokedexUpdatesAtom = Atom(
      name: 'ProfileControllerBase.notifyPokedexUpdates', context: context);

  @override
  bool get notifyPokedexUpdates {
    _$notifyPokedexUpdatesAtom.reportRead();
    return super.notifyPokedexUpdates;
  }

  @override
  set notifyPokedexUpdates(bool value) {
    _$notifyPokedexUpdatesAtom.reportWrite(value, super.notifyPokedexUpdates,
        () {
      super.notifyPokedexUpdates = value;
    });
  }

  late final _$notifyPokemonWorldAtom =
      Atom(name: 'ProfileControllerBase.notifyPokemonWorld', context: context);

  @override
  bool get notifyPokemonWorld {
    _$notifyPokemonWorldAtom.reportRead();
    return super.notifyPokemonWorld;
  }

  @override
  set notifyPokemonWorld(bool value) {
    _$notifyPokemonWorldAtom.reportWrite(value, super.notifyPokemonWorld, () {
      super.notifyPokemonWorld = value;
    });
  }

  late final _$ProfileControllerBaseActionController =
      ActionController(name: 'ProfileControllerBase', context: context);

  @override
  void toggleMegaEvolutions(bool value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.toggleMegaEvolutions');
    try {
      return super.toggleMegaEvolutions(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleOtherForms(bool value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.toggleOtherForms');
    try {
      return super.toggleOtherForms(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePokedexUpdates(bool value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.togglePokedexUpdates');
    try {
      return super.togglePokedexUpdates(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePokemonWorld(bool value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.togglePokemonWorld');
    try {
      return super.togglePokemonWorld(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enableMegaEvolutions: ${enableMegaEvolutions},
enableOtherForms: ${enableOtherForms},
notifyPokedexUpdates: ${notifyPokedexUpdates},
notifyPokemonWorld: ${notifyPokemonWorld}
    ''';
  }
}
