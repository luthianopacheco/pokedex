import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/domain/models/order_options.dart';
import 'package:pokedex/features/home/domain/repositories/i_home_repository.dart';

@injectable
class LoadFilterOptionsUseCase {
  final IHomeRepository _repository;

  LoadFilterOptionsUseCase(this._repository);

  Future<List<OrderOptions>> execute() async {
    return await _repository.loadOrderFilterOptions();
  }
}
