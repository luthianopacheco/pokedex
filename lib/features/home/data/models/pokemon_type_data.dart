import 'package:flutter/material.dart';
import 'package:pokedex/features/home/data/models/selector_item_data.dart';
import 'package:pokedex/features/home/domain/models/pokemon_type.dart';

class PokemonTypeData implements SelectorItemData {
  @override
  final String type;

  @override
  final String label;

  @override
  final Color color;

  PokemonTypeData({
    required this.type,
    required this.label,
    required this.color,
  });

  factory PokemonTypeData.fromJson(Map<String, dynamic> json) {
    return PokemonTypeData(
      type: json['type'],
      label: json['label'],
      color: Color(int.parse(json['color'].replaceFirst('#', '0xff'))),
    );
  }

  PokemonType toDomain() {
    return PokemonType(type: type, label: label, color: color);
  }
}
