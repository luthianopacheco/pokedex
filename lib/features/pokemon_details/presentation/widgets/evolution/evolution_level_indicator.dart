import 'package:flutter/material.dart';
import 'package:pokedex/gen/assets.gen.dart';

class EvolutionLevelIndicator extends StatelessWidget {
  final int minLevel;
  const EvolutionLevelIndicator({super.key, required this.minLevel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        Assets.icons.generalIcons.arrowDown.image(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Nível $minLevel',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
