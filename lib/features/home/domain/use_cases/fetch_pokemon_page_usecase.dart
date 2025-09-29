import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/domain/repositories/i_home_repository.dart';
import 'package:pokedex/shared/domain/models/pokemon.dart';

@injectable
class FetchPokemonPageUseCase {
  final IHomeRepository _repository;

  FetchPokemonPageUseCase(this._repository);

  Future<List<Pokemon>> execute(List<int> ids) async {
    List<Pokemon> result = await _repository.getPokemonsByIdsFromCache(ids);

    final needFetching = result.where((p) => !p.isBasicFetched).toList();

    if (needFetching.isNotEmpty) {
      await _repository.getAndCacheMissingDetails(needFetching);
      result = await _repository.getPokemonsByIdsFromCache(ids);
    }
    return result;
  }
}
