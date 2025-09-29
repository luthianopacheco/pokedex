// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: 'HomeStoreBase.hasError'))
      .value;
  Computed<bool>? _$isTypeFilterActiveComputed;

  @override
  bool get isTypeFilterActive => (_$isTypeFilterActiveComputed ??=
          Computed<bool>(() => super.isTypeFilterActive,
              name: 'HomeStoreBase.isTypeFilterActive'))
      .value;

  late final _$pokemonsAtom =
      Atom(name: 'HomeStoreBase.pokemons', context: context);

  @override
  ObservableList<Pokemon> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<Pokemon> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$selectedTypeAtom =
      Atom(name: 'HomeStoreBase.selectedType', context: context);

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
      Atom(name: 'HomeStoreBase.selectedOrder', context: context);

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
      Atom(name: 'HomeStoreBase.searchPokemon', context: context);

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
      Atom(name: 'HomeStoreBase.isLoading', context: context);

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
      Atom(name: 'HomeStoreBase.isLoadingMore', context: context);

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
      Atom(name: 'HomeStoreBase.errorMessage', context: context);

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

  late final _$isInitializedAtom =
      Atom(name: 'HomeStoreBase.isInitialized', context: context);

  @override
  bool get isInitialized {
    _$isInitializedAtom.reportRead();
    return super.isInitialized;
  }

  @override
  set isInitialized(bool value) {
    _$isInitializedAtom.reportWrite(value, super.isInitialized, () {
      super.isInitialized = value;
    });
  }

  late final _$filteredIdsAtom =
      Atom(name: 'HomeStoreBase.filteredIds', context: context);

  @override
  List<int> get filteredIds {
    _$filteredIdsAtom.reportRead();
    return super.filteredIds;
  }

  @override
  set filteredIds(List<int> value) {
    _$filteredIdsAtom.reportWrite(value, super.filteredIds, () {
      super.filteredIds = value;
    });
  }

  late final _$filteredNamesAtom =
      Atom(name: 'HomeStoreBase.filteredNames', context: context);

  @override
  List<String> get filteredNames {
    _$filteredNamesAtom.reportRead();
    return super.filteredNames;
  }

  @override
  set filteredNames(List<String> value) {
    _$filteredNamesAtom.reportWrite(value, super.filteredNames, () {
      super.filteredNames = value;
    });
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void setFilters(List<PokemonType> types, List<OrderOptions> orders) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setFilters');
    try {
      return super.setFilters(types, orders);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPokemonList(List<Pokemon> list) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setPokemonList');
    try {
      return super.setPokemonList(list);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPokemons(List<Pokemon> list) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.addPokemons');
    try {
      return super.addPokemons(list);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedTypeItem(SelectorItem item) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSelectedTypeItem');
    try {
      return super.setSelectedTypeItem(item);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedOrderItem(SelectorItem item) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSelectedOrderItem');
    try {
      return super.setSelectedOrderItem(item);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilteredIds(List<int> ids) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setFilteredIds');
    try {
      return super.setFilteredIds(ids);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilteredNames(List<String> names) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setFilteredNames');
    try {
      return super.setFilteredNames(names);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearError() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.clearError');
    try {
      return super.clearError();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String message) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setError');
    try {
      return super.setError(message);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingMore(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setLoadingMore');
    try {
      return super.setLoadingMore(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
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
isInitialized: ${isInitialized},
filteredIds: ${filteredIds},
filteredNames: ${filteredNames},
hasError: ${hasError},
isTypeFilterActive: ${isTypeFilterActive}
    ''';
  }
}
