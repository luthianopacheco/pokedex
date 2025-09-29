import 'package:pokedex/features/pokemon_details/domain/models/evolution.dart';

class EvolutionChain {
  final int id;
  final List<Evolution> evolutions;
  EvolutionChain({required this.id, required this.evolutions});
}
