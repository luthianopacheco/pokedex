import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/domain/models/order_options.dart';
import 'package:pokedex/features/home/domain/models/pokemon_type.dart';
import 'package:pokedex/features/home/domain/repositories/i_home_repository.dart';

@injectable
class LoadFilterOptionsUseCase {
  final IHomeRepository _repository;

  LoadFilterOptionsUseCase(this._repository);

  Future<({List<PokemonType> types, List<OrderOptions> orders})>
  execute() async {
    final types = await _repository.loadTypeFilterOptions();
    final orders = await _repository.loadOrderFilterOptions();

    return (types: types, orders: orders);
  }
}
