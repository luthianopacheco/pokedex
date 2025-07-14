import 'package:hive_flutter/adapters.dart';
import 'package:pokedex/features/home/models/pokemon_basics.dart';

class HiveConfigs {
  static run() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PokemonBasicsAdapter());
    if (!Hive.isBoxOpen('pokemon_basic')) {
      await Hive.openBox<PokemonBasics>('pokemon_basic');
    }
  }
}
