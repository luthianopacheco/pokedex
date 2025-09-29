import 'package:hive/hive.dart';
import 'package:pokedex/features/pokemon_details/data/models/evolution_data.dart';
import 'package:pokedex/features/pokemon_details/domain/models/evolution_chain.dart';

part 'evolution_chain_data.g.dart';

@HiveType(typeId: 3)
class EvolutionChainData extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final List<EvolutionData> evolutions;

  EvolutionChainData({required this.id, required this.evolutions});

  factory EvolutionChainData.fromJson(Map<String, dynamic> json) {
    final evolutions = <EvolutionData>[];

    void mapJson(Map<String, dynamic> item) {
      final species = item['species'] as Map<String, dynamic>?;

      if (species != null) {
        final url = species['url'] as String? ?? '';
        final parts = url.split('/');
        if (parts.length >= 2) {
          final id = int.tryParse(parts[parts.length - 2]) ?? 0;
          final name = species['name'] as String? ?? 'unknown';

          final details = (item['evolution_details'] as List?)?.firstOrNull;
          final minLevel = details?['min_level'];

          evolutions.add(
            EvolutionData(id: id, name: name, minLevel: minLevel, url: url),
          );
        }
      }

      final evolvesTo = item['evolves_to'] as List<dynamic>?;
      if (evolvesTo != null && evolvesTo.isNotEmpty) {
        for (final e in evolvesTo) {
          mapJson(e as Map<String, dynamic>);
        }
      }
    }

    mapJson(json['chain'] as Map<String, dynamic>);

    return EvolutionChainData(id: json['id'], evolutions: evolutions);
  }

  EvolutionChain toDomain() {
    return EvolutionChain(
      id: id,
      evolutions: evolutions.map((e) => e.toDomain()).toList(),
    );
  }
}
