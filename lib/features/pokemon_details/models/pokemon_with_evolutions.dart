import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/features/pokemon_details/models/evolution_chain.dart';

class PokemonWithEvolutions {
  final Pokemon pokemon;
  final EvolutionChain? evolutionChain;

  PokemonWithEvolutions({required this.pokemon, required this.evolutionChain});
}
