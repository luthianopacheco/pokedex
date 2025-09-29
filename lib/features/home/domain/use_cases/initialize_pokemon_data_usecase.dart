import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/domain/repositories/i_home_repository.dart';

@injectable
class InitializePokemonDataUseCase {
  final IHomeRepository _repository;

  InitializePokemonDataUseCase(this._repository);

  Future<void> execute() async {
    return _repository.getAndCachePokemonBasics();
  }
}