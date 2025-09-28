import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_details/widgets/header/animated_pokemon.dart';
import 'package:pokedex/features/pokemon_details/widgets/header/details_appbar.dart';
import 'package:pokedex/features/pokemon_details/widgets/header/name_and_number.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/utils/color/color_utils.dart';
import 'package:pokedex/shared/utils/pokemons/pokemon_utils.dart';

class DetailsHeader extends StatelessWidget {
  final Pokemon pokemon;
  const DetailsHeader({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final color = pokemon.types?.first == null
        ? Colors.black
        : PokemonTypeUtils.getColor(pokemon.types?.first).contrastColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AnimatedPokemon(
              animatedUrl: pokemon.animatedImageUrl ?? '',
              pokemonHeight: pokemon.height ?? 150,
              type: pokemon.types?.first ?? '',
            ),
            DetailsAppbar(iconsColor: color),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: NameAndNumber(id: pokemon.id.toString(), name: pokemon.name),
        ),
      ],
    );
  }
}
