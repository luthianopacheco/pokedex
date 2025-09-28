import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/shared/models/pokemon.dart';

@lazySingleton
class PokemonCacheService {
  static const String _boxName = 'pokemon_box';
  Box<Pokemon>? _box;

  Future<Box<Pokemon>> _openBox() async {
    if (_box != null && _box!.isOpen) return _box!;
    _box = await Hive.openBox<Pokemon>(_boxName);
    return _box!;
  }

  Future<void> saveAll(List<Pokemon> pokemons) async {
    final box = await _openBox();
    for (var pokemon in pokemons) {
      await box.put(pokemon.id, pokemon);
    }
  }

  Future<void> save(Pokemon pokemon) async {
    final box = await _openBox();
    await box.put(pokemon.id, pokemon);
  }

  Future<Pokemon?> getById(int id) async {
    final box = await _openBox();
    return box.get(id);
  }

  Future<List<Pokemon>> getAll() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<List<Pokemon>> getOrderedById() async {
    final all = await getAll();
    all.sort((a, b) => a.id.compareTo(b.id));
    return all;
  }

  Future<void> clear() async {
    final box = await _openBox();
    await box.clear();
  }

  Future<List<Pokemon>> getFetchedOrderedById() async {
    final all = await getAll();
    final fetched = all.where((e) => e.isBasicFetched).toList()
      ..sort((a, b) => a.id.compareTo(b.id));
    return fetched;
  }
}
