import 'package:flutter/material.dart';
import 'package:pokedex/features/home/domain/models/selector_item.dart';

class PokemonType implements SelectorItem {
  @override
  final String type;

  @override
  final String label;

  @override
  final Color color;

  const PokemonType({
    required this.type,
    required this.label,
    required this.color,
  });
}
