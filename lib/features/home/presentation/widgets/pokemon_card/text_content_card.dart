import 'package:flutter/material.dart';
import 'package:pokedex/shared/domain/models/pokemon.dart';
import 'package:pokedex/shared/utils/text/string_utils.dart';
import 'package:pokedex/shared/widgets/chips/pokemon_types_widget.dart';

class TextContentCard extends StatelessWidget {
  final Pokemon pokemon;
  const TextContentCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _pokemonNumberText(context),
            SizedBox(height: 2),
            _pokemonName(context),
            SizedBox(height: 6),
            PokemonTypesWidget(types: pokemon.types),
          ],
        ),
      ),
    );
  }

  Widget _pokemonNumberText(BuildContext context) {
    return Text(
      'N°${pokemon.id.toString().padLeft(3, '0')}',
      style: Theme.of(context).textTheme.labelSmall,
    );
  }

  Widget _pokemonName(BuildContext context) {
    return Text(
      pokemon.name.capitalizeFirst(),
      style: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
