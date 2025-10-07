import 'package:pokedex/features/home/domain/models/pokemon_type.dart';

abstract class ITypeRepository {
  Future<List<PokemonType>> loadTypeOptions();
}