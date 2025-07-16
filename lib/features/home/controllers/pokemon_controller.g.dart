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

  late final _$_filteredIdsAtom =
      Atom(name: 'PokemonControllerBase._filteredIds', context: context);

  @override
  List<int> get _filteredIds {
    _$_filteredIdsAtom.reportRead();
    return super._filteredIds;
  }

  @override
  set _filteredIds(List<int> value) {
    _$_filteredIdsAtom.reportWrite(value, super._filteredIds, () {
      super._filteredIds = value;
    });
  }

  late final _$_filteredNamesAtom =
      Atom(name: 'PokemonControllerBase._filteredNames', context: context);

  @override
  List<String> get _filteredNames {
    _$_filteredNamesAtom.reportRead();
    return super._filteredNames;
  }

  @override
  set _filteredNames(List<String> value) {
    _$_filteredNamesAtom.reportWrite(value, super._filteredNames, () {
      super._filteredNames = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('PokemonControllerBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$_loadFiltersAsyncAction =
      AsyncAction('PokemonControllerBase._loadFilters', context: context);

  @override
  Future<void> _loadFilters() {
    return _$_loadFiltersAsyncAction.run(() => super._loadFilters());
  }

  late final _$setSearchPokemonAsyncAction =
      AsyncAction('PokemonControllerBase.setSearchPokemon', context: context);

  @override
  Future<void> setSearchPokemon(String value) {
    return _$setSearchPokemonAsyncAction
        .run(() => super.setSearchPokemon(value));
  }

  late final _$setSelectedTypeAsyncAction =
      AsyncAction('PokemonControllerBase.setSelectedType', context: context);

  @override
  Future<void> setSelectedType(SelectorItem item) {
    return _$setSelectedTypeAsyncAction.run(() => super.setSelectedType(item));
  }

  late final _$setSelectedOrderAsyncAction =
      AsyncAction('PokemonControllerBase.setSelectedOrder', context: context);

  @override
  Future<void> setSelectedOrder(SelectorItem item) {
    return _$setSelectedOrderAsyncAction
        .run(() => super.setSelectedOrder(item));
  }

  late final _$_refreshListAsyncAction =
      AsyncAction('PokemonControllerBase._refreshList', context: context);

  @override
  Future<void> _refreshList() {
    return _$_refreshListAsyncAction.run(() => super._refreshList());
  }

  late final _$loadMorePokemonsAsyncAction =
      AsyncAction('PokemonControllerBase.loadMorePokemons', context: context);

  @override
  Future<void> loadMorePokemons() {
    return _$loadMorePokemonsAsyncAction.run(() => super.loadMorePokemons());
  }

  late final _$_updateFilteredIdsAsyncAction =
      AsyncAction('PokemonControllerBase._updateFilteredIds', context: context);

  @override
  Future<void> _updateFilteredIds() {
    return _$_updateFilteredIdsAsyncAction
        .run(() => super._updateFilteredIds());
  }

  late final _$_loadNextPageAsyncAction =
      AsyncAction('PokemonControllerBase._loadNextPage', context: context);

  @override
  Future<void> _loadNextPage() {
    return _$_loadNextPageAsyncAction.run(() => super._loadNextPage());
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
  String toString() {
    return '''
pokemons: ${pokemons},
selectedType: ${selectedType},
selectedOrder: ${selectedOrder},
searchPokemon: ${searchPokemon},
isLoading: ${isLoading},
isLoadingMore: ${isLoadingMore},
errorMessage: ${errorMessage},
hasError: ${hasError}
    ''';
  }
}
