import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/shared/utils/pokemons/pokemon_utils_store.dart';

class InitInjections {
  static run() async{
    await getIt<PokemonTypeStore>().loadTypes();
  }
}