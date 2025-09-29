import 'package:pokedex/shared/data/models/gender_data.dart';
import 'package:pokedex/shared/data/models/pokemon_data.dart';
import 'package:pokedex/shared/domain/models/gender.dart';

class Pokemon {
  final int id;
  final String name;
  final String url;
  final String imageUrl;
  final List<String> types;
  final bool isBasicFetched;
  final String animatedImageUrl;
  final String description;
  final double weight;
  final double height;
  final String category;
  final List<String> abilities;
  final Gender gender;
  final List<String> weaknesses;
  final int chainId;
  final bool isDetailsFetched;
  Pokemon({
    required this.id,
    required this.name,
    required this.url,
    required this.imageUrl,
    required this.types,
    required this.isBasicFetched,
    required this.animatedImageUrl,
    required this.description,
    required this.weight,
    required this.height,
    required this.category,
    required this.abilities,
    required this.gender,
    required this.weaknesses,
    required this.chainId,
    required this.isDetailsFetched,
  });

  PokemonData toData() {
    return PokemonData(
      id: id,
      name: name,
      url: url,
      imageUrl: imageUrl,
      types: types,
      isBasicFetched: isBasicFetched,
      animatedImageUrl: animatedImageUrl,
      description: description,
      weight: weight,
      height: height,
      category: category,
      abilities: abilities,
      gender: GenderData(male: gender.male, female: gender.female),
      weaknesses: weaknesses,
      chainId: chainId,
      isDetailsFetched: isDetailsFetched,
    );
  }
}
