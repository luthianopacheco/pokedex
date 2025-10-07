import 'package:pokedex/features/home/domain/models/order_options.dart';
import 'package:pokedex/shared/domain/models/pokemon.dart';

abstract class IHomeRepository {
  Future<void> getAndCachePokemonBasics();
  Future<void> getAndCacheMissingDetails(List<Pokemon> list);
  Future<List<Pokemon>> getPokemonsByIdsFromCache(List<int> ids);
  Future<List<OrderOptions>> loadOrderFilterOptions();
  Future<List<String>> getPokemonNamesByType(String typeName);
  Future<List<int>> getFilteredPokemonIds({
    String? search,
    String? type,
    String? order,
    List<String>? namesOnly,
  });
  
}
