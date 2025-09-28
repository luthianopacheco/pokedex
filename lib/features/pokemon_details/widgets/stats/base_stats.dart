import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_details/widgets/stats/gender_bar_widget.dart';
import 'package:pokedex/features/pokemon_details/widgets/stats/base_row.dart';
import 'package:pokedex/shared/models/pokemon.dart';

class BaseStats extends StatelessWidget {
  final Pokemon pokemon;
  const BaseStats({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        BaseRowWidget(
          weight: pokemon.weight.toString(),
          height: pokemon.height.toString(),
          category: pokemon.category ?? '',
        ),
        const SizedBox(height: 5),
        GenderBarWidget(
          malePercent: pokemon.gender?.male ?? 0,
          femalePercent: pokemon.gender?.female ?? 0,
        ),
      ],
    );
  }
}
