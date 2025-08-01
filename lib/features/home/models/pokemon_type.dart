import 'package:flutter/material.dart';
import 'package:pokedex/features/home/models/selector_item.dart';

class PokemonType implements SelectorItem {
  @override
  final String type;
  @override
  final String label;
  @override
  final Color color;

  PokemonType({required this.type, required this.label, required this.color});

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      type: json['type'],
      label: json['label'],
      color: Color(int.parse(json['color'].replaceFirst('#', '0xff'))),
    );
  }
}
