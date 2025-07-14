import 'package:hive/hive.dart';

part 'pokemon_basics.g.dart';

@HiveType(typeId: 0)
class PokemonBasics extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String url;

  @HiveField(3)
  String? imageUrl;

  @HiveField(4)
  List<String>? types;

  @HiveField(5)
  bool isFetched;

  PokemonBasics({
    required this.id,
    required this.name,
    required this.url,
    this.imageUrl,
    this.types,
    this.isFetched = false,
  });

  factory PokemonBasics.fromJson(Map<String, dynamic> json) {
    final url = json['url'];
    final id = int.parse(url.split('/')[url.split('/').length - 2]);

    return PokemonBasics(
      id: id,
      name: json['name'],
      url: url,
      isFetched: false,
    );
  }

  PokemonBasics copyWith(Map<String, dynamic> json) {
    final imageUrl = json['sprites']['front_default'];
    final types = (json['types'] as List?)
        ?.map((e) => e['type']['name'].toString().toLowerCase())
        .toList();

    return PokemonBasics(
      id: id,
      name: name,
      url: url,
      imageUrl: imageUrl ?? this.imageUrl,
      types: types ?? this.types,
      isFetched: imageUrl != null && types != null && types.isNotEmpty,
    );
  }
}
