import 'package:flutter/material.dart';
import 'package:pokedex/features/home/models/pokemon_basics.dart';
import 'package:pokedex/shared/utils/color/color_utils.dart';
import 'package:pokedex/shared/utils/pokemons/pokemon_utils.dart';

class ImageContentCard extends StatelessWidget {
  final PokemonBasics pokemon;
  const ImageContentCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        _card(child: Stack(children: [_backgroundImage(), _pokemonImage()])),
        _favIconButton(),
      ],
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      width: 126,
      height: 102,
      decoration: BoxDecoration(
        color: PokemonTypeUtils.getColor(pokemon.types?.first.toLowerCase()),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }

  Widget _backgroundImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              PokemonTypeUtils.getColor(pokemon.types?.first.toLowerCase()),
              Colors.white,
            ],
          ).createShader(bounds),
          blendMode: BlendMode.srcATop,
          child: Image.asset(
            PokemonTypeUtils.getTypeImage(pokemon.types?.first),
          ),
        ),
      ),
    );
  }

  Widget _pokemonImage() {
    return Center(
      child: Image.network(
        pokemon.imageUrl ?? '',
        errorBuilder: (context, error, stackTrace) => Text(
          'Indisponível',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: PokemonTypeUtils.getColor(
              pokemon.types?.first,
            ).contrastColor,
          ),
        ),
      ),
    );
  }

  Widget _favIconButton() {
    return IconButton(
      icon: Image.asset('assets/icons/general_icons/fav-2-unselected.png'),
      onPressed: () {},
      color: Colors.white,
    );
  }
}
