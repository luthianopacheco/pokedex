import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/domain/repositories/i_home_repository.dart';

@injectable
class GetFilteredPokemonIdsUseCase {
  final IHomeRepository _repository;

  GetFilteredPokemonIdsUseCase(this._repository);

  Future<List<int>> execute({
    required String search,
    required String? selectedType,
    required String? selectedOrder,
    required bool isTypeFilterActive,
    required List<String> filteredNames,
  }) async {
    final List<String>? namesOnly = isTypeFilterActive ? filteredNames : null;

    return _repository.getFilteredPokemonIds(
      search: search,
      type: selectedType,
      order: selectedOrder,
      namesOnly: namesOnly,
    );
  }
}