import 'package:hive/hive.dart';

part 'evolution.g.dart';

@HiveType(typeId: 4)
class Evolution extends HiveObject {
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

  Evolution({
    required this.id,
    required this.name,
    this.minLevel,
    this.url,
    this.imageUrl,
    this.types,
  });

  factory Evolution.fromJson(Map<String, dynamic> json) {
    final url = json['url'];
    final id = int.parse(url.split('/')[url.split('/').length - 2]);

    return Evolution(
      id: id,
      name: json['name'],
      imageUrl: json['sprites']?['front_default'],
      types: (json['types'] as List?)
          ?.map((e) => e['type']['name'].toString().toLowerCase())
          .toList(),
    );
  }

  bool get isComplete => imageUrl != null && types != null;
}
