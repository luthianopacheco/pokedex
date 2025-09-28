import 'package:flutter/material.dart';

class EvolutionLevelIndicator extends StatelessWidget {
  final int minLevel;
  const EvolutionLevelIndicator({super.key, required this.minLevel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icons/general_icons/arrow-down.png', height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Nível $minLevel',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Color(0xff173EA5)),
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
