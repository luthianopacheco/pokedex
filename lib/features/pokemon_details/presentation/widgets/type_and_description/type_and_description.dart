import 'package:flutter/material.dart';
import 'package:pokedex/shared/widgets/chips/pokemon_types_widget.dart';

class TypeAndDescription extends StatelessWidget {
  final List<String> types;
  final String description;

  const TypeAndDescription({
    super.key,
    required this.types,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        PokemonTypesWidget(
          types: types,
          rowMaxWidth: 600,
          itemWidth: 150,
          spacing: 12,
        ),
        Text(
          description,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
