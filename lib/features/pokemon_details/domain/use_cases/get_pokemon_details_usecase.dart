import 'package:injectable/injectable.dart';
import 'package:pokedex/features/pokemon_details/domain/repositories/i_pokemon_details_repository.dart';
import 'package:pokedex/features/pokemon_details/presentation/stores/pokemon_details_store.dart';

@injectable
class GetPokemonDetailsUseCase {
  final IPokemonDetailsRepository _repository;
  final PokemonDetailsStore _store;

  GetPokemonDetailsUseCase(this._repository, this._store);

  Future<void> execute({required int id}) async {
    _store.setLoading(true);
    _store.clearError();

    try {
      final result = await _repository.getAndCachePokemonDetails(id: id);

      _store.setPokemon(result.pokemon);

      if (result.evolutionChain != null) {
        _store.setEvolutionChain(result.evolutionChain!);
      }
    } catch (e) {
      _store.setError(e.toString().split('Exception:').last.trim());
      rethrow;
    } finally {
      _store.setLoading(false);
    }
  }
}
