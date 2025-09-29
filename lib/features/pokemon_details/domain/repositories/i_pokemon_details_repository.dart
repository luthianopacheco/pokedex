import 'package:pokedex/features/pokemon_details/domain/models/pokemon_with_evolutions.dart';

abstract class IPokemonDetailsRepository {
  Future<PokemonWithEvolutions> getAndCachePokemonDetails({required int id});
}