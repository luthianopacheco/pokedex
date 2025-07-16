import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/models/pokemon_basics.dart';
import 'package:pokedex/features/home/models/pokemon_type.dart';
import 'package:pokedex/features/home/models/order_options.dart';
import 'package:pokedex/features/home/models/selector_item.dart';
import 'package:pokedex/features/home/repositories/pokemon_repository.dart';
import 'package:pokedex/shared/utils/pokemons/pokemon_utils.dart';

part 'pokemon_controller.g.dart';

@lazySingleton
class PokemonController = PokemonControllerBase with _$PokemonController;

abstract class PokemonControllerBase with Store {
  final PokemonRepository _repository;

  PokemonControllerBase(this._repository);

  final int _pageSize = 20;
  int _currentPage = 0;
  Timer? _lastTyping;
  List<PokemonType> pokemonTypes = [];
  List<OrderOptions> orderOptions = [];

  @observable
  ObservableList<PokemonBasics> pokemons = ObservableList<PokemonBasics>();

  @observable
  PokemonType? selectedType;

  @observable
  OrderOptions? selectedOrder;

  @observable
  String searchPokemon = '';

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingMore = false;

  @observable
  String? errorMessage;

  @observable
  bool _isInitialized = false;

  @observable
  List<int> _filteredIds = [];

  @observable
  List<String> _filteredNames = [];

  @computed
  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  bool get _isTypeFilterActive =>
      selectedType != null &&
      selectedType!.type != 'all' &&
      _filteredNames.isNotEmpty;

  @action
  Future<void> init() async {
    try {
      isLoading = true;
      clearError();

      await _loadFilters();

      if (!_isInitialized) {
        await _repository.getAndCachePokemonBasics();
        _isInitialized = true;
      }

      await _updateFilteredIds();

      final initialIds = _filteredIds.take(_pageSize).toList();

      List<PokemonBasics> result = await _repository.getPokemonsByIdsFromCache(
        initialIds,
      );

      final needFetching = result.where((p) => !p.isFetched);
      if (needFetching.isNotEmpty) {
        await _repository.getAndCacheMissingDetails(needFetching.toList());
        result = await _repository.getPokemonsByIdsFromCache(initialIds);
      }

      pokemons = ObservableList.of(result);
      _currentPage = 0;
    } catch (e) {
      errorMessage = e.toString().split('Exception:').last;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> _loadFilters() async {
    try {
      pokemonTypes = ObservableList.of(
        await _repository.loadTypeFilterOptions(),
      );
      orderOptions = ObservableList.of(
        await _repository.loadOrderFilterOptions(),
      );
      selectedType = pokemonTypes.first;
      selectedOrder = orderOptions.first;
      PokemonTypeUtils.setTypes(pokemonTypes);
    } catch (e) {
      errorMessage = e.toString().split('Exception:').last;
    }
  }

  @action
  Future<void> setSearchPokemon(String value) async {
    _lastTyping?.cancel();
    isLoading = true;

    _lastTyping = Timer(const Duration(milliseconds: 800), () async {
      try {
        searchPokemon = value;
        await _refreshList();
      } catch (e) {
        errorMessage = e.toString().split('Exception:').last;
      } finally {
        isLoading = false;
      }
    });
  }

  @action
  Future<void> setSelectedType(SelectorItem item) async {
    try {
      isLoading = true;
      selectedType = item as PokemonType;
      _filteredNames.clear();

      final type = selectedType?.type;
      if (type != null && type != 'all') {
        _filteredNames = await _repository.getPokemonNamesByType(type);
      }

      await _refreshList();
    } catch (e) {
      errorMessage = e.toString().split('Exception:').last;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> setSelectedOrder(SelectorItem item) async {
    try {
      isLoading = true;
      selectedOrder = item as OrderOptions;
      await _refreshList();
    } catch (e) {
      errorMessage = e.toString().split('Exception:').last;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> _refreshList() async {
    try {
      _currentPage = 0;
      pokemons.clear();
      await _updateFilteredIds();
      await _loadNextPage();
    } catch (e) {
      errorMessage = e.toString().split('Exception:').last;
    }
  }

  @action
  Future<void> loadMorePokemons() async {
    if (isLoadingMore || _currentPage * _pageSize >= _filteredIds.length) {
      return;
    }

    try {
      isLoadingMore = true;
      _currentPage++;
      await _loadNextPage();
      isLoadingMore = false;
    } catch (e) {
      errorMessage = e.toString().split('Exception:').last;
    }
  }

  @action
  Future<void> _updateFilteredIds() async {
    try {
      _filteredIds = await _repository.getFilteredPokemonIds(
        search: searchPokemon,
        type: selectedType?.type == 'all' ? null : selectedType?.type,
        order: selectedOrder?.type,
        namesOnly: _isTypeFilterActive ? _filteredNames : null,
      );
    } catch (e) {
      errorMessage = e.toString().split('Exception:').last;
    }
  }

  @action
  Future<void> _loadNextPage() async {
    try {
      final start = _currentPage * _pageSize;

      final ids = _filteredIds.skip(start).take(_pageSize).toList();
      if (ids.isEmpty) return;

      List<PokemonBasics> result = await _repository.getPokemonsByIdsFromCache(
        ids,
      );

      final needFetching = result.where((p) => !p.isFetched);
      if (needFetching.isNotEmpty) {
        await _repository.getAndCacheMissingDetails(needFetching.toList());
        final updated = await _repository.getPokemonsByIdsFromCache(ids);
        pokemons.addAll(updated);
      } else {
        await Future.delayed(const Duration(milliseconds: 400));
        pokemons.addAll(result);
      }
    } catch (e) {
      errorMessage = e.toString().split('Exception:').last;
    }
  }

  @action
  void clearError() {
    errorMessage = null;
  }
}
