import 'package:injectable/injectable.dart';
import 'package:pokedex/core/stores/app_error_store.dart';
import 'package:pokedex/features/pokemon_details/domain/use_cases/get_pokemon_details_usecase.dart';
import 'package:pokedex/features/pokemon_details/presentation/stores/pokemon_details_store.dart';

@lazySingleton
class PokemonDetailsController {
  final PokemonDetailsStore store;
  final AppErrorStore _appErrorStore;
  final GetPokemonDetailsUseCase _getDetailsUseCase;

  PokemonDetailsController(
    this.store,
    this._getDetailsUseCase,
    this._appErrorStore,
  );

  Future<void> getPokemonDetails({required int id}) async {
    try {
      _appErrorStore.clearGlobalError();
      await _getDetailsUseCase.execute(id: id);
    } catch (e) {
      _appErrorStore.setGlobalError(
        'Erro inesperado',
        e.toString(),
        onRetry: () => getPokemonDetails(id: id),
      );
    }
  }
}
