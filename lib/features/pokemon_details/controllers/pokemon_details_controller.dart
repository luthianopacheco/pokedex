import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/features/pokemon_details/models/evolution_chain.dart';
import 'package:pokedex/features/pokemon_details/models/pokemon_with_evolutions.dart';
import 'package:pokedex/features/pokemon_details/repositories/pokemon_details_repository.dart';

part 'pokemon_details_controller.g.dart';

@lazySingleton
class PokemonDetailsController = PokemonDetailsControllerBase
    with _$PokemonDetailsController;

abstract class PokemonDetailsControllerBase with Store {
  final PokemonDetailsRepository _repository;

  PokemonDetailsControllerBase(this._repository);

  @observable
  Pokemon? pokemon;

  @observable
  EvolutionChain? evolutionChain;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @computed
  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  @action
  Future<void> getPokemonDetails({required int id}) async {
    try {
      isLoading = true;
      clearError();

      PokemonWithEvolutions result = await _repository
          .getAndCachePokemonDetails(id: id);

      pokemon = result.pokemon;
      evolutionChain = result.evolutionChain;
    } catch (e) {
      errorMessage = e.toString().split('Exception:').last;
    } finally {
      isLoading = false;
    }
  }

  @action
  void clearError() {
    errorMessage = null;
  }
}
