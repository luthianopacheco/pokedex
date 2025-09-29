import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/pokemon_details/data/models/evolution_chain_data.dart';

@lazySingleton
class EvolutionChainCacheService {
  static const String _boxName = 'evolution_chain_box';
  Box<EvolutionChainData>? _box;

  Future<Box<EvolutionChainData>> _openBox() async {
    if (_box != null && _box!.isOpen) return _box!;
    _box = await Hive.openBox<EvolutionChainData>(_boxName);
    return _box!;
  }

  Future<void> saveAll(List<EvolutionChainData> chains) async {
    final box = await _openBox();
    for (var chain in chains) {
      await box.put(chain.id, chain);
    }
  }

  Future<void> save(EvolutionChainData chain) async {
    final box = await _openBox();
    await box.put(chain.id, chain);
  }

  Future<EvolutionChainData?> getById(int id) async {
    final box = await _openBox();
    return box.get(id);
  }

  Future<List<EvolutionChainData>> getAll() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> clear() async {
    final box = await _openBox();
    await box.clear();
  }
}
