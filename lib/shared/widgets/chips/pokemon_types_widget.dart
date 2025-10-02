import 'package:flutter/material.dart';
import 'package:pokedex/shared/utils/color/color_utils.dart';
import 'package:pokedex/shared/utils/pokemons/pokemon_utils.dart';

class PokemonTypesWidget extends StatelessWidget {
  final List<String> types;
  final double rowMaxWidth;
  final double? itemWidth;
  final WrapAlignment alignment;
  final double spacing;
  final double runSpacing;
  final bool showText;
  final bool showIcon;
  final BorderStyle borderStyle;
  final Color? textColor;
  const PokemonTypesWidget({
    super.key,
    required this.types,
    this.rowMaxWidth = 250,
    this.alignment = WrapAlignment.start,
    this.spacing = 5,
    this.runSpacing = 10,
    this.itemWidth,
    this.showText = true,
    this.showIcon = true,
    this.borderStyle = BorderStyle.none,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: rowMaxWidth,
      child: Wrap(
        spacing: spacing,
        runSpacing: runSpacing,
        alignment: alignment,
        children: types.map((type) {
          return _buildTypes(context, type);
        }).toList(),
      ),
    );
  }

  Widget _buildTypes(BuildContext context, String type) {
    final color = PokemonTypeUtils.getColor(type);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      width: itemWidth,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(style: borderStyle),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showIcon)
            ClipOval(
              child: Container(
                height: 24,
                width: 24,
                color: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(PokemonTypeUtils.getTypeImage(type)),
                ),
              ),
            ),
          const SizedBox(width: 6),
          if (showText)
            Text(
              PokemonTypeUtils.getLabel(type) ?? '',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: textColor ?? color.contrastColor,
              ),
            ),
        ],
      ),
    );
  }
}
