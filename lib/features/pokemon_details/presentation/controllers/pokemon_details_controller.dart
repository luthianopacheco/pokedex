import 'package:injectable/injectable.dart';
import 'package:pokedex/features/pokemon_details/domain/use_cases/get_pokemon_details_usecase.dart';
import 'package:pokedex/features/pokemon_details/presentation/stores/pokemon_details_store.dart';

@lazySingleton
class PokemonDetailsController {
  final PokemonDetailsStore store;
  final GetPokemonDetailsUseCase _getDetailsUseCase;

  PokemonDetailsController(this.store, this._getDetailsUseCase);

  Future<void> getPokemonDetails({required int id}) async {
    try {
      await _getDetailsUseCase.execute(id: id);
    } catch (e) {
      store.setError(e.toString().split('Exception:').last);
    }
  }
}
