import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/shared/data/models/pokemon_data.dart';

@lazySingleton
class PokemonCacheService {
  static const String _boxName = 'pokemon_box';
  Box<PokemonData>? _box;

  Future<Box<PokemonData>> _openBox() async {
    if (_box != null && _box!.isOpen) return _box!;
    _box = await Hive.openBox<PokemonData>(_boxName);
    return _box!;
  }

  Future<void> saveAll(List<PokemonData> pokemons) async {
    final box = await _openBox();
    for (var pokemon in pokemons) {
      await box.put(pokemon.id, pokemon);
    }
  }

  Future<void> save(PokemonData pokemon) async {
    final box = await _openBox();
    await box.put(pokemon.id, pokemon);
  }

  Future<PokemonData?> getById(int id) async {
    final box = await _openBox();
    return box.get(id);
  }

  Future<List<PokemonData>> getAll() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<List<PokemonData>> getOrderedById() async {
    final all = await getAll();
    all.sort((a, b) => a.id.compareTo(b.id));
    return all;
  }

  Future<void> clear() async {
    final box = await _openBox();
    await box.clear();
  }

  Future<List<PokemonData>> getFetchedOrderedById() async {
    final all = await getAll();
    final fetched = all.where((e) => e.isBasicFetched).toList()
      ..sort((a, b) => a.id.compareTo(b.id));
    return fetched;
  }
}
