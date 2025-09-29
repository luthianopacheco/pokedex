import 'package:pokedex/features/pokemon_details/domain/models/evolution_chain.dart';
import 'package:pokedex/shared/data/models/pokemon_data.dart';

class PokemonWithEvolutions {
  final PokemonData pokemon;
  final EvolutionChain? evolutionChain;

  PokemonWithEvolutions({required this.pokemon, required this.evolutionChain});
}
