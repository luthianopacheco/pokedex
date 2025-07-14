// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonController on PokemonControllerBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: 'PokemonControllerBase.hasError'))
          .value;

  late final _$pokemonsAtom =
      Atom(name: 'PokemonControllerBase.pokemons', context: context);

  @override
  ObservableList<PokemonBasics> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<PokemonBasics> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$pokemonsTypeAtom =
      Atom(name: 'PokemonControllerBase.pokemonsType', context: context);

  @override
  ObservableList<PokemonType> get pokemonsType {
    _$pokemonsTypeAtom.reportRead();
    return super.pokemonsType;
  }

  @override
  set pokemonsType(ObservableList<PokemonType> value) {
    _$pokemonsTypeAtom.reportWrite(value, super.pokemonsType, () {
      super.pokemonsType = value;
    });
  }

  late final _$orderOptionsAtom =
      Atom(name: 'PokemonControllerBase.orderOptions', context: context);

  @override
  ObservableList<OrderOptions> get orderOptions {
    _$orderOptionsAtom.reportRead();
    return super.orderOptions;
  }

  @override
  set orderOptions(ObservableList<OrderOptions> value) {
    _$orderOptionsAtom.reportWrite(value, super.orderOptions, () {
      super.orderOptions = value;
    });
  }

  late final _$selectedTypeAtom =
      Atom(name: 'PokemonControllerBase.selectedType', context: context);

  @override
  PokemonType? get selectedType {
    _$selectedTypeAtom.reportRead();
    return super.selectedType;
  }

  @override
  set selectedType(PokemonType? value) {
    _$selectedTypeAtom.reportWrite(value, super.selectedType, () {
      super.selectedType = value;
    });
  }

  late final _$selectedOrderAtom =
      Atom(name: 'PokemonControllerBase.selectedOrder', context: context);

  @override
  OrderOptions? get selectedOrder {
    _$selectedOrderAtom.reportRead();
    return super.selectedOrder;
  }

  @override
  set selectedOrder(OrderOptions? value) {
    _$selectedOrderAtom.reportWrite(value, super.selectedOrder, () {
      super.selectedOrder = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'PokemonControllerBase.isLoading', context: context);

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

  late final _$isLoadingMoreAtom =
      Atom(name: 'PokemonControllerBase.isLoadingMore', context: context);

  @override
  bool get isLoadingMore {
    _$isLoadingMoreAtom.reportRead();
    return super.isLoadingMore;
  }

  @override
  set isLoadingMore(bool value) {
    _$isLoadingMoreAtom.reportWrite(value, super.isLoadingMore, () {
      super.isLoadingMore = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'PokemonControllerBase.errorMessage', context: context);

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

  late final _$searchPokemonAtom =
      Atom(name: 'PokemonControllerBase.searchPokemon', context: context);

  @override
  String get searchPokemon {
    _$searchPokemonAtom.reportRead();
    return super.searchPokemon;
  }

  @override
  set searchPokemon(String value) {
    _$searchPokemonAtom.reportWrite(value, super.searchPokemon, () {
      super.searchPokemon = value;
    });
  }

  late final _$searchResultsAtom =
      Atom(name: 'PokemonControllerBase.searchResults', context: context);

  @override
  ObservableList<PokemonBasics> get searchResults {
    _$searchResultsAtom.reportRead();
    return super.searchResults;
  }

  @override
  set searchResults(ObservableList<PokemonBasics> value) {
    _$searchResultsAtom.reportWrite(value, super.searchResults, () {
      super.searchResults = value;
    });
  }

  late final _$_isInitializedAtom =
      Atom(name: 'PokemonControllerBase._isInitialized', context: context);

  @override
  bool get _isInitialized {
    _$_isInitializedAtom.reportRead();
    return super._isInitialized;
  }

  @override
  set _isInitialized(bool value) {
    _$_isInitializedAtom.reportWrite(value, super._isInitialized, () {
      super._isInitialized = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('PokemonControllerBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$getPokemonsAsyncAction =
      AsyncAction('PokemonControllerBase.getPokemons', context: context);

  @override
  Future<void> getPokemons() {
    return _$getPokemonsAsyncAction.run(() => super.getPokemons());
  }

  late final _$setSearchPokemonAsyncAction =
      AsyncAction('PokemonControllerBase.setSearchPokemon', context: context);

  @override
  Future<void> setSearchPokemon(String value) {
    return _$setSearchPokemonAsyncAction
        .run(() => super.setSearchPokemon(value));
  }

  late final _$getMoreSearchResultsAsyncAction = AsyncAction(
      'PokemonControllerBase.getMoreSearchResults',
      context: context);

  @override
  Future<void> getMoreSearchResults() {
    return _$getMoreSearchResultsAsyncAction
        .run(() => super.getMoreSearchResults());
  }

  late final _$PokemonControllerBaseActionController =
      ActionController(name: 'PokemonControllerBase', context: context);

  @override
  void clearError() {
    final _$actionInfo = _$PokemonControllerBaseActionController.startAction(
        name: 'PokemonControllerBase.clearError');
    try {
      return super.clearError();
    } finally {
      _$PokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedType(SelectorItem item) {
    final _$actionInfo = _$PokemonControllerBaseActionController.startAction(
        name: 'PokemonControllerBase.setSelectedType');
    try {
      return super.setSelectedType(item);
    } finally {
      _$PokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedOrder(SelectorItem item) {
    final _$actionInfo = _$PokemonControllerBaseActionController.startAction(
        name: 'PokemonControllerBase.setSelectedOrder');
    try {
      return super.setSelectedOrder(item);
    } finally {
      _$PokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
pokemonsType: ${pokemonsType},
orderOptions: ${orderOptions},
selectedType: ${selectedType},
selectedOrder: ${selectedOrder},
isLoading: ${isLoading},
isLoadingMore: ${isLoadingMore},
errorMessage: ${errorMessage},
searchPokemon: ${searchPokemon},
searchResults: ${searchResults},
hasError: ${hasError}
    ''';
  }
}
