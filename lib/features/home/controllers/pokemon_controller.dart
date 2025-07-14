import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/models/pokemon_basics.dart';
import 'package:pokedex/features/home/models/pokemon_type.dart';
import 'package:pokedex/features/home/models/order_options.dart';
import 'package:pokedex/features/home/models/selector_item.dart';
import 'package:pokedex/features/home/repositories/pokemon_repository.dart';

part 'pokemon_controller.g.dart';

@lazySingleton
class PokemonController = PokemonControllerBase with _$PokemonController;

abstract class PokemonControllerBase with Store {
  final PokemonRepository _repository;

  PokemonControllerBase(this._repository) {
    pokemonsType = ObservableList.of(pokemonTypeList);
    orderOptions = ObservableList.of(orderOptionsList);
    selectedType = pokemonsType.first;
    selectedOrder = orderOptions.first;
  }

  @observable
  ObservableList<PokemonBasics> pokemons = ObservableList<PokemonBasics>();

  @observable
  ObservableList<PokemonType> pokemonsType = ObservableList<PokemonType>();

  @observable
  ObservableList<OrderOptions> orderOptions = ObservableList<OrderOptions>();

  @observable
  PokemonType? selectedType;

  @observable
  OrderOptions? selectedOrder;

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingMore = false;

  @observable
  String? errorMessage;

  @observable
  String searchPokemon = '';

  @observable
  ObservableList<PokemonBasics> searchResults = ObservableList<PokemonBasics>();

  Timer? _lastTyping;

  @observable
  bool _isInitialized = false;

  @computed
  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  @action
  Future<void> init() async {
    try {
      isLoading = true;
      errorMessage = null;

      if (!_isInitialized) {
        await _repository.getAndCachePokemonBasics();
        _isInitialized = true;
      }

      List<PokemonBasics> result = await _repository
          .getPaginatedPokemonsFromCache(offset: 0, limit: 20);

      if (result.isEmpty) {
        final all = await _repository.getAllFromCache();
        final firstBatch = all.take(20).toList();

        await _repository.getAndCacheMissingDetails(firstBatch);

        result = await _repository.getPaginatedPokemonsFromCache(
          offset: 0,
          limit: 20,
        );
      }

      pokemons = ObservableList.of(result);
    } catch (e) {
      errorMessage = e.toString().split('Exception:').last;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> getPokemons() async {
    try {
      isLoadingMore = true;
      errorMessage = null;

      final allPokemons = await _repository.getAllFromCache();

      if (pokemons.length >= allPokemons.length) return;

      List<PokemonBasics> nextPokemons = allPokemons
          .where((e) => !pokemons.any((p) => p.id == e.id))
          .skip(0)
          .take(20)
          .toList();

      if (nextPokemons.isEmpty) return;

      final needFetching = nextPokemons.any((e) => !e.isFetched);

      if (needFetching) {
        await _repository.getAndCacheMissingDetails(nextPokemons);
        nextPokemons = await _repository.getPaginatedPokemonsFromCache(
          offset: pokemons.length,
          limit: 20,
        );
      } else {
        await Future.delayed(const Duration(milliseconds: 500));
      }

      pokemons.addAll(nextPokemons);
    } catch (e) {
      errorMessage = e.toString().split('Exception:').last;
    } finally {
      isLoadingMore = false;
    }
  }

  @action
  void clearError() {
    errorMessage = null;
  }

  @action
  Future<void> setSearchPokemon(String value) async {
    _lastTyping?.cancel();
    isLoading = true;

    _lastTyping = Timer(const Duration(seconds: 1), () async {
      try {
        searchPokemon = value;
        searchResults.clear();

        if (searchPokemon.trim().isEmpty) {
          isLoading = false;
          return;
        }

        await getMoreSearchResults();
      } catch (e) {
        errorMessage = e.toString().split('Exception:').last;
      } finally {
        isLoading = false;
      }
    });
  }

  @action
  Future<void> getMoreSearchResults() async {
    try {
      isLoadingMore = true;
      final all = await _repository.getAllFromCache();

      final filtered = all.where((p) {
        final name = p.name.toLowerCase();
        final id = p.id.toString();
        final search = searchPokemon.toLowerCase();
        return name.contains(search) || id.contains(search);
      }).toList();

      List<PokemonBasics> nextPokemons = filtered
          .skip(searchResults.length)
          .take(20)
          .toList();

      if (nextPokemons.isEmpty) return;

      final needFetching = nextPokemons.any((e) => !e.isFetched);

      if (needFetching) {
        await _repository.getAndCacheMissingDetails(nextPokemons);
        nextPokemons = await _repository.getPokemonsByIdsFromCache(
          nextPokemons.map((e) => e.id).toList(),
        );
      } else {
        await Future.delayed(const Duration(milliseconds: 500));
      }

      searchResults.addAll(nextPokemons);
    } catch (e) {
      errorMessage = e.toString().split('Exception:').last;
    } finally {
      isLoadingMore = false;
    }
  }

  @action
  void setSelectedType(SelectorItem item) {
    selectedType = item as PokemonType;
  }

  @action
  void setSelectedOrder(SelectorItem item) {
    selectedOrder = item as OrderOptions;
  }
}
