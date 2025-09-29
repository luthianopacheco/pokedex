import 'package:flutter/material.dart';
import 'package:pokedex/shared/utils/text/string_utils.dart';

class NameAndNumber extends StatelessWidget {
  final String id;
  final String name;
  const NameAndNumber({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name.capitalizeFirst(),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          'N°${id.padLeft(3, '0')}',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
