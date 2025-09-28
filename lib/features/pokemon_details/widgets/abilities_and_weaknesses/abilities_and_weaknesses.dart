import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_details/widgets/abilities_and_weaknesses/attribute_list_widget.dart';
import 'package:pokedex/shared/utils/text/string_utils.dart';

class AbilitiesAndWeaknesses extends StatelessWidget {
  final List<String> abilities;
  final List<String> weaknesses;
  const AbilitiesAndWeaknesses({
    super.key,
    required this.abilities,
    required this.weaknesses,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        AttributeListWidget(
          title: 'Habilidades',
          list: abilities.map((e) => e.capitalizeFirst()).toList(),
          showIcon: false,
          borderStyle: BorderStyle.solid,
        ),
        const SizedBox(height: 5),
        AttributeListWidget(title: 'Fraquezas', list: weaknesses),
      ],
    );
  }
}
