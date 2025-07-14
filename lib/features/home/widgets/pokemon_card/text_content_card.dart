import 'package:flutter/material.dart';
import 'package:pokedex/features/home/models/pokemon_basics.dart';
import 'package:pokedex/shared/utils/color/color_utils.dart';
import 'package:pokedex/shared/utils/pokemons/pokemon_utils.dart';
import 'package:pokedex/shared/utils/text/string_utils.dart';

class TextContentCard extends StatelessWidget {
  final PokemonBasics pokemon;
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
            _pokemonTypes(context),
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

  Widget _pokemonTypes(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 250),
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        children:
            pokemon.types?.map((type) {
              return buildTypes(context, type);
            }).toList() ??
            [],
      ),
    );
  }

  Widget buildTypes(BuildContext context, String type) {
    final color = PokemonTypeUtils.getColor(type);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Container(
              height: 24,
              width: 24,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Image.asset(PokemonTypeUtils.getTypeImage(type)),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            PokemonTypeUtils.getLabel(type) ?? '',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: color.contrastColor,
            ),
          ),
        ],
      ),
    );
  }
}
