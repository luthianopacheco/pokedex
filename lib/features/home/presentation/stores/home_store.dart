import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/domain/models/selector_item.dart';
import 'package:pokedex/shared/domain/models/pokemon.dart';
import 'package:pokedex/features/home/domain/models/pokemon_type.dart';
import 'package:pokedex/features/home/domain/models/order_options.dart';

part 'home_store.g.dart';

@lazySingleton
class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  ObservableList<Pokemon> pokemons = ObservableList<Pokemon>();

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
  bool isInitialized = false;

  @observable
  List<int> filteredIds = [];

  @observable
  List<String> filteredNames = [];

  List<PokemonType> pokemonTypes = [];
  List<OrderOptions> orderOptions = [];

  @computed
  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  @computed
  bool get isTypeFilterActive =>
      selectedType != null &&
      selectedType!.type != 'all' &&
      filteredNames.isNotEmpty;

  @action
  void setFilters(List<PokemonType> types, List<OrderOptions> orders) {
    pokemonTypes = types;
    orderOptions = orders;
    selectedType = types.first;
    selectedOrder = orders.first;
  }

  @action
  void setPokemonList(List<Pokemon> list) {
    pokemons = ObservableList.of(list);
  }

  @action
  void addPokemons(List<Pokemon> list) {
    pokemons.addAll(list);
  }

  @action
  void setSearch(String value) {
    searchPokemon = value;
  }

  @action
  void setSelectedTypeItem(SelectorItem item) {
    selectedType = item as PokemonType;
  }

  @action
  void setSelectedOrderItem(SelectorItem item) {
    selectedOrder = item as OrderOptions;
  }

  @action
  void setFilteredIds(List<int> ids) {
    filteredIds = ids;
  }

  @action
  void setFilteredNames(List<String> names) {
    filteredNames = names;
  }

  @action
  void clearError() {
    errorMessage = null;
  }

  @action
  void setError(String message) {
    errorMessage = message;
  }

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  void setLoadingMore(bool value) => isLoadingMore = value;
}
