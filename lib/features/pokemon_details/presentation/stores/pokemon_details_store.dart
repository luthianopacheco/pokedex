import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/features/pokemon_details/domain/models/evolution_chain.dart';
import 'package:pokedex/shared/data/models/pokemon_data.dart';

part 'pokemon_details_store.g.dart';

@lazySingleton
class PokemonDetailsStore = PokemonDetailsStoreBase with _$PokemonDetailsStore;

abstract class PokemonDetailsStoreBase with Store {
  @observable
  PokemonData? pokemon;

  @observable
  EvolutionChain? evolutionChain;

  @observable
  bool isLoading = false;

  @action
  void setPokemon(PokemonData value) => pokemon = value;

  @action
  void setEvolutionChain(EvolutionChain value) => evolutionChain = value;

  @action
  void setLoading(bool value) => isLoading = value;
}
