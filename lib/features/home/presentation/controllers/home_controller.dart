import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/domain/models/selector_item.dart';
import 'package:pokedex/features/home/domain/use_cases/fetch_pokemon_page_usecase.dart';
import 'package:pokedex/features/home/domain/use_cases/get_filtered_pokemon_ids_usecase.dart';
import 'package:pokedex/features/home/domain/use_cases/get_pokemon_names_by_type_usecase.dart';
import 'package:pokedex/features/home/domain/use_cases/initialize_pokemon_data_usecase.dart';
import 'package:pokedex/features/home/domain/use_cases/load_filter_options_usecase.dart';
import 'package:pokedex/features/home/presentation/stores/home_store.dart';
import 'package:pokedex/shared/utils/pokemons/pokemon_utils.dart';

@lazySingleton
class HomeController {
  final HomeStore store;
  final FetchPokemonPageUseCase _fetchPageUC;
  final GetFilteredPokemonIdsUseCase _getFilteredIdsUC;
  final GetPokemonNamesByTypeUseCase _getPokemonNamesByTypeUC;
  final InitializePokemonDataUseCase _initializePokemonDataUC;
  final LoadFilterOptionsUseCase _loadFiltersUC;

  HomeController(
    this.store,
    this._fetchPageUC,
    this._getFilteredIdsUC,
    this._getPokemonNamesByTypeUC,
    this._initializePokemonDataUC,
    this._loadFiltersUC,
  );

  final int _pageSize = 20;
  int _currentPage = 0;
  Timer? _lastTyping;

  Future<void> init() async {
    try {
      store.setLoading(true);
      store.clearError();

      final filters = await _loadFiltersUC.execute();
      store.setFilters(filters.types, filters.orders);
      PokemonTypeUtils.setTypes(filters.types);

      if (!store.isInitialized) {
        await _initializePokemonDataUC.execute();
        store.isInitialized = true;
      }

      await _refreshList();
    } catch (e) {
      store.setError(e.toString().split('Exception:').last);
    } finally {
      store.setLoading(false);
    }
  }

  Future<void> setSearchPokemon(String value) async {
    _lastTyping?.cancel();
    store.setLoading(true);
    store.setSearch(value);

    _lastTyping = Timer(const Duration(milliseconds: 800), () async {
      try {
        await _refreshList();
      } catch (e) {
        store.setError(e.toString().split('Exception:').last);
      } finally {
        store.setLoading(false);
      }
    });
  }

  Future<void> setSelectedType(SelectorItem item) async {
    try {
      store.setLoading(true);
      store.setSelectedTypeItem(item);
      store.setFilteredNames([]);

      final type = store.selectedType?.type;
      if (type != null && type != 'all') {
        final names = await _getPokemonNamesByTypeUC.execute(type);
        store.setFilteredNames(names);
      }

      await _refreshList();
    } catch (e) {
      store.setError(e.toString().split('Exception:').last);
    } finally {
      store.setLoading(false);
    }
  }

  Future<void> setSelectedOrder(SelectorItem item) async {
    try {
      store.setLoading(true);
      store.setSelectedOrderItem(item);
      await _refreshList();
    } catch (e) {
      store.setError(e.toString().split('Exception:').last);
    } finally {
      store.setLoading(false);
    }
  }

  Future<void> _refreshList() async {
    try {
      _currentPage = 0;
      store.pokemons.clear();

      final ids = await _getFilteredIdsUC.execute(
        search: store.searchPokemon,
        selectedType: store.selectedType?.type,
        selectedOrder: store.selectedOrder?.type,
        isTypeFilterActive: store.isTypeFilterActive,
        filteredNames: store.filteredNames,
      );
      store.setFilteredIds(ids);

      await _loadNextPage(isInitialLoad: true);
    } catch (e) {
      store.setError(e.toString().split('Exception:').last);
    }
  }

  Future<void> loadMorePokemons() async {
    if (store.isLoadingMore ||
        _currentPage * _pageSize >= store.filteredIds.length) {
      return;
    }

    try {
      store.setLoadingMore(true);
      _currentPage++;
      await _loadNextPage(isInitialLoad: false);
    } catch (e) {
      store.setError(e.toString().split('Exception:').last);
    } finally {
      store.setLoadingMore(false);
    }
  }

  Future<void> _loadNextPage({required bool isInitialLoad}) async {
    final start = _currentPage * _pageSize;
    final ids = store.filteredIds.skip(start).take(_pageSize).toList();
    if (ids.isEmpty) return;

    final result = await _fetchPageUC.execute(ids);

    if (isInitialLoad) {
      store.setPokemonList(result);
    } else {
      await Future.delayed(const Duration(milliseconds: 400));
      store.addPokemons(result);
    }
  }
}
