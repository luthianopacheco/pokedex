import 'package:hive/hive.dart';
import 'package:pokedex/features/pokemon_details/models/evolution.dart';

part 'evolution_chain.g.dart';

@HiveType(typeId: 3)
class EvolutionChain extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final List<Evolution> evolutions;

  EvolutionChain({required this.id, required this.evolutions});

  factory EvolutionChain.fromJson(Map<String, dynamic> json) {
    final evolutions = <Evolution>[];

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
            Evolution(id: id, name: name, minLevel: minLevel, url: url),
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

    return EvolutionChain(id: json['id'], evolutions: evolutions);
  }
}
