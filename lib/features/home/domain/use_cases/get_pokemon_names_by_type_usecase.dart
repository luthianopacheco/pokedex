import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/domain/repositories/i_home_repository.dart';

@injectable
class GetPokemonNamesByTypeUseCase {
  final IHomeRepository _repository;

  GetPokemonNamesByTypeUseCase(this._repository);

  Future<List<String>> execute(String typeName) async {
    return _repository.getPokemonNamesByType(typeName);
  }
}