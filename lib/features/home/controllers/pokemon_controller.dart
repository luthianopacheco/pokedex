import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/models/pokemon.dart';
import 'package:pokedex/features/home/models/pokemon_type.dart';
import 'package:pokedex/features/home/models/order_options.dart';
import 'package:pokedex/features/home/models/selector_item.dart';
import 'package:pokedex/features/home/repositories/pokemon_repository.dart';

part 'pokemon_controller.g.dart';

@injectable
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
  ObservableList<Pokemon> pokemons = ObservableList<Pokemon>();

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

  DateTime? _lastReq;

  @computed
  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  @action
  Future<void> init() async {
    if (pokemons.isEmpty) {
      await getPokemons();
    }
  }

  @action
  Future<void> getPokemons() async {
    try {
      pokemons.isEmpty ? isLoading = true : isLoadingMore = true;
      errorMessage = null;

      final result = await _repository.getPokemons(length: pokemons.length);
      pokemons.addAll(result);
    } catch (e) {
      errorMessage = e.toString().split('Exception:').last;
    } finally {
      isLoading ? isLoading = false : isLoadingMore = false;
    }
  }

  void handleScrollTrigger(Function onTrigger) {
    final now = DateTime.now();

    if (_lastReq != null && now.difference(_lastReq!) <= Duration(seconds: 4) ||
        isLoadingMore) {
      return;
    }

    _lastReq = now;
    onTrigger();
  }

  @action
  void clearError() {
    errorMessage = null;
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
