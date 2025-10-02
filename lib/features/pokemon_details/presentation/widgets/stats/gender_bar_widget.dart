import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_colors.dart';

class GenderBarWidget extends StatelessWidget {
  final double malePercent;
  final double femalePercent;
  const GenderBarWidget({
    super.key,
    required this.malePercent,
    required this.femalePercent,
  });

  @override
  Widget build(BuildContext context) {
    final textDarkStyle = Theme.of(context).textTheme.labelSmall?.copyWith(
      color: Theme.of(context).colorScheme.onSurface.withAlpha(99),
    );
    
    return Column(
      children: [
        Text('GÊNERO', textAlign: TextAlign.center, style: textDarkStyle),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LinearProgressIndicator(
            value: malePercent / 100,
            backgroundColor: malePercent + femalePercent > 0
                ? AppColors.primaryPink
                : AppColors.disabledColor,
            color: AppColors.secondaryBlue,
            minHeight: 10,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 3,
                children: [
                  Icon(Icons.male_rounded, size: 16),
                  Text('$malePercent%', style: textDarkStyle),
                ],
              ),
              Row(
                spacing: 3,
                children: [
                  Icon(Icons.female_rounded, size: 16),
                  Text('$femalePercent%', style: textDarkStyle),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
