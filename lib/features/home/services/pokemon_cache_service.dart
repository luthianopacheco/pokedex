import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/home/models/pokemon_basics.dart';

@lazySingleton
class PokemonCacheService {
  static const String _boxName = 'pokemon_basic';
  Box<PokemonBasics>? _box;

  Future<Box<PokemonBasics>> _openBox() async {
    if (_box != null && _box!.isOpen) return _box!;
    _box = await Hive.openBox<PokemonBasics>(_boxName);
    return _box!;
  }

  Future<void> saveAll(List<PokemonBasics> pokemons) async {
    final box = await _openBox();
    for (var pokemon in pokemons) {
      await box.put(pokemon.id, pokemon);
    }
  }

  Future<void> save(PokemonBasics pokemon) async {
    final box = await _openBox();
    await box.put(pokemon.id, pokemon);
  }

  Future<PokemonBasics?> getById(int id) async {
    final box = await _openBox();
    return box.get(id);
  }

  Future<List<PokemonBasics>> getAll() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<List<PokemonBasics>> getOrderedById() async {
    final all = await getAll();
    all.sort((a, b) => a.id.compareTo(b.id));
    return all;
  }

  Future<void> clear() async {
    final box = await _openBox();
    await box.clear();
  }

  Future<List<PokemonBasics>> getFetchedOrderedById() async {
    final all = await getAll();
    final fetched = all.where((e) => e.isFetched).toList()
      ..sort((a, b) => a.id.compareTo(b.id));
    return fetched;
  }
}
