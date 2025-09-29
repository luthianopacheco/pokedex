import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_details/domain/models/evolution.dart';
import 'package:pokedex/features/pokemon_details/presentation/widgets/evolution/evolution_card.dart';
import 'package:pokedex/features/pokemon_details/presentation/widgets/evolution/evolution_level_indicator.dart';

class EvolutionChainWidget extends StatelessWidget {
  final List<Evolution> evolutions;
  const EvolutionChainWidget({super.key, required this.evolutions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Evoluções',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ...evolutions.map((evo) {
                return Column(
                  children: [
                    if (evo.minLevel != null)
                      EvolutionLevelIndicator(minLevel: evo.minLevel ?? 0),
                    EvolutionCard(evolution: evo),
                  ],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
