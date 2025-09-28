import 'package:hive_flutter/adapters.dart';
import 'package:pokedex/features/pokemon_details/models/evolution.dart';
import 'package:pokedex/features/pokemon_details/models/gender.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/features/pokemon_details/models/evolution_chain.dart';

class HiveConfigs {
  static run() async {
    await Hive.initFlutter();

    Hive.registerAdapter(PokemonAdapter());
    Hive.registerAdapter(GenderAdapter());
    Hive.registerAdapter(EvolutionChainAdapter());
    Hive.registerAdapter(EvolutionAdapter());

    if (!Hive.isBoxOpen('pokemon_box')) {
      await Hive.openBox<Pokemon>('pokemon_box');
    }

    if (!Hive.isBoxOpen('evolution_chain_box')) {
      await Hive.openBox<EvolutionChain>('evolution_chain_box');
    }
  }
}
