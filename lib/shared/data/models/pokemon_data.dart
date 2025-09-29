import 'package:hive/hive.dart';
import 'package:pokedex/shared/data/models/gender_data.dart';
import 'package:pokedex/shared/domain/models/gender.dart';
import 'package:pokedex/shared/domain/models/pokemon.dart';

part 'pokemon_data.g.dart';

@HiveType(typeId: 0)
class PokemonData extends HiveObject {
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
  bool isBasicFetched;

  @HiveField(6)
  String? animatedImageUrl;

  @HiveField(7)
  String? description;

  @HiveField(8)
  double? weight;

  @HiveField(9)
  double? height;

  @HiveField(10)
  String? category;

  @HiveField(11)
  List<String>? abilities;

  @HiveField(12)
  GenderData? gender;

  @HiveField(13)
  List<String>? weaknesses;

  @HiveField(14)
  int? chainId;

  @HiveField(15)
  bool isDetailsFetched;

  PokemonData({
    required this.id,
    required this.name,
    required this.url,
    this.imageUrl,
    this.types,
    this.isBasicFetched = false,
    this.animatedImageUrl,
    this.description,
    this.weight,
    this.height,
    this.category,
    this.abilities,
    this.gender,
    this.weaknesses,
    this.chainId,
    this.isDetailsFetched = false,
  });

  factory PokemonData.fromJson(Map<String, dynamic> json) {
    final url = json['url'];
    final id = int.parse(url.split('/')[url.split('/').length - 2]);

    return PokemonData(
      id: id,
      name: json['name'],
      url: url,
      isBasicFetched: false,

      isDetailsFetched: false,
    );
  }

  PokemonData copyWithBasics(Map<String, dynamic> json) {
    final imageUrl = json['sprites']['front_default'];
    final animated = json['sprites']['other']['showdown']['front_default'];
    final types = (json['types'] as List?)
        ?.map((e) => e['type']['name'].toString().toLowerCase())
        .toList();
    final abilities = (json['abilities'] as List?)
        ?.map((e) => e['ability']['name'].toString().toLowerCase())
        .toList();

    final weight = (json['weight'] ?? 0) / 10;
    final height = (json['height'] ?? 0) / 10;

    return PokemonData(
      id: id,
      name: name,
      url: url,
      imageUrl: imageUrl ?? this.imageUrl,
      types: types ?? this.types,
      isBasicFetched: imageUrl != null && types != null && types.isNotEmpty,
      animatedImageUrl: animated,
      weight: weight ?? this.abilities,
      height: height ?? this.abilities,
      abilities: abilities ?? this.abilities,
    );
  }

  PokemonData copyWithDetails({
    required Map<String, dynamic> speciesJson,
    required Map<String, dynamic> typeJson,
  }) {
    final String? categoryResponse = (speciesJson['genera'] as List?)
        ?.firstWhere(
          (e) => e['language']['name'] == 'en',
          orElse: () => {'genus': 'Undefined'},
        )['genus'];

    final category = categoryResponse?.split('Pokémon').first.trim();

    final String? descriptionResponse =
        (speciesJson['flavor_text_entries'] as List?)?.firstWhere(
          (e) => e['language']['name'] == 'en',
          orElse: () => {'flavor_text': null},
        )['flavor_text'];

    final description = descriptionResponse
        ?.replaceAll(RegExp(r'[\n\f]'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();

    final gender = GenderData.fromJson(speciesJson['gender_rate']);

    final weaknesses =
        (typeJson['damage_relations']['double_damage_from'] as List?)
            ?.map((e) => e['name'].toString().toLowerCase())
            .toList();

    final evolutionChainUrl =
        (speciesJson['evolution_chain']?['url']) as String?;
    int? chainId;

    if (evolutionChainUrl != null) {
      final parts = evolutionChainUrl.split('/');
      final idStr = parts.length >= 2 ? parts[parts.length - 2] : null;
      chainId = idStr != null ? int.tryParse(idStr) : null;
    }

    return PokemonData(
      id: id,
      name: name,
      url: url,
      imageUrl: imageUrl,
      types: types,
      isBasicFetched: true,
      animatedImageUrl: animatedImageUrl,
      weight: weight,
      height: height,
      abilities: abilities,
      description: description ?? this.description,
      category: category ?? this.category,
      weaknesses: weaknesses ?? this.weaknesses,
      gender: gender,
      chainId: chainId,
      isDetailsFetched:
          description != null &&
          category != null &&
          (weaknesses?.isNotEmpty ?? false),
    );
  }

  Pokemon toDomain() {
    return Pokemon(
      id: id,
      name: name,
      url: url,
      imageUrl: imageUrl ?? '',
      types: types ?? [],
      isBasicFetched: isBasicFetched,
      animatedImageUrl: animatedImageUrl ?? '',
      description: description ?? '',
      weight: weight ?? 0,
      height: height ?? 0,
      category: category ?? '',
      abilities: abilities ?? [],
      gender: gender?.toDomain() ?? Gender(male: 0, female: 0),
      weaknesses: weaknesses ?? [],
      chainId: chainId ?? 0,
      isDetailsFetched: isDetailsFetched,
    );
  }
}
