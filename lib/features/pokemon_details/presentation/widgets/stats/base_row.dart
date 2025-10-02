import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_colors.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/shared/utils/helper/path_helper.dart';
import 'package:pokedex/shared/utils/text/string_utils.dart';

class BaseRowWidget extends StatelessWidget {
  final String weight;
  final String height;
  final String category;
  const BaseRowWidget({
    super.key,
    required this.weight,
    required this.height,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _infoCard(
              context,
              iconName: 'weight',
              label: 'PESO',
              value: '$weight kg',
            ),
            _infoCard(
              context,
              iconName: 'height',
              label: 'ALTURA',
              value: '$height m',
            ),
          ],
        ),
        if (category.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _infoCard(
                context,
                iconName: 'category',
                label: 'CATEGORIA',
                value: category.capitalizeFirst(),
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ],
          ),
      ],
    );
  }

  Widget _infoCard(
    BuildContext context, {
    required String iconName,
    required String label,
    required String value,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    final partialPath = AssetUtils.getPartialPath(
      Assets.icons.generalIcons.arrowDown.path,
    );
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 5,
          children: [
            Image.asset('$partialPath/$iconName.png', height: 14),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(99),
              ),
            ),
          ],
        ),
        Container(
          width: 150,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.disabledColorLight),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
