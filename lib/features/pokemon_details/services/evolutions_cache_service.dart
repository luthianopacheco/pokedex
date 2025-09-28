import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/features/pokemon_details/models/evolution_chain.dart';

@lazySingleton
class EvolutionChainCacheService {
  static const String _boxName = 'evolution_chain_box';
  Box<EvolutionChain>? _box;

  Future<Box<EvolutionChain>> _openBox() async {
    if (_box != null && _box!.isOpen) return _box!;
    _box = await Hive.openBox<EvolutionChain>(_boxName);
    return _box!;
  }

  Future<void> saveAll(List<EvolutionChain> chains) async {
    final box = await _openBox();
    for (var chain in chains) {
      await box.put(chain.id, chain);
    }
  }

  Future<void> save(EvolutionChain chain) async {
    final box = await _openBox();
    await box.put(chain.id, chain);
  }

  Future<EvolutionChain?> getById(int id) async {
    final box = await _openBox();
    return box.get(id);
  }

  Future<List<EvolutionChain>> getAll() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> clear() async {
    final box = await _openBox();
    await box.clear();
  }
}
