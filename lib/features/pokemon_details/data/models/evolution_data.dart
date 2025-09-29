import 'package:hive/hive.dart';
import 'package:pokedex/features/pokemon_details/domain/models/evolution.dart';

part 'evolution_data.g.dart';

@HiveType(typeId: 4)
class EvolutionData extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int? minLevel;

  @HiveField(3)
  final String? url;

  @HiveField(4)
  final String? imageUrl;

  @HiveField(5)
  final List<String>? types;

  EvolutionData({
    required this.id,
    required this.name,
    this.minLevel,
    this.url,
    this.imageUrl,
    this.types,
  });

  factory EvolutionData.fromJson(Map<String, dynamic> json) {
    final url = json['url'];
    final id = int.parse(url.split('/')[url.split('/').length - 2]);

    return EvolutionData(
      id: id,
      name: json['name'],
      imageUrl: json['sprites']?['front_default'],
      types: (json['types'] as List?)
          ?.map((e) => e['type']['name'].toString().toLowerCase())
          .toList(),
    );
  }

  Evolution toDomain() {
    return Evolution(
      id: id,
      name: name,
      minLevel: minLevel,
      imageUrl: imageUrl,
      types: types,
    );
  }

  bool get isComplete => imageUrl != null && types != null;
}
