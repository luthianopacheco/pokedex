import 'package:hive_flutter/adapters.dart';
import 'package:pokedex/features/pokemon_details/data/models/evolution_chain_data.dart';
import 'package:pokedex/features/pokemon_details/data/models/evolution_data.dart';
import 'package:pokedex/shared/data/models/gender_data.dart';
import 'package:pokedex/shared/data/models/pokemon_data.dart';

class HiveConfigs {
  static run() async {
    await Hive.initFlutter();

    Hive.registerAdapter(PokemonDataAdapter());
    Hive.registerAdapter(GenderDataAdapter());
    Hive.registerAdapter(EvolutionChainDataAdapter());
    Hive.registerAdapter(EvolutionDataAdapter());

    if (!Hive.isBoxOpen('pokemon_box')) {
      await Hive.openBox<PokemonData>('pokemon_box');
    }

    if (!Hive.isBoxOpen('evolution_chain_box')) {
      await Hive.openBox<EvolutionChainData>('evolution_chain_box');
    }
  }
}
