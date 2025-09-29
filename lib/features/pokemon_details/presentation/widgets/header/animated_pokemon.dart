import 'package:flutter/material.dart';
import 'package:pokedex/shared/utils/pokemons/pokemon_utils.dart';
import 'package:pokedex/shared/widgets/images/shader_image.dart';

class AnimatedPokemon extends StatelessWidget {
  final String staticImageUrl;
  final String animatedUrl;
  final double pokemonHeight;
  final String type;
  const AnimatedPokemon({
    super.key,
    required this.staticImageUrl,
    required this.animatedUrl,
    required this.pokemonHeight,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final double height = pokemonHeight > 1.5 ? 250 : 150;
    return Stack(
      children: [
        Container(
          height: 270,
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                PokemonTypeUtils.getColor(type.toLowerCase()).withAlpha(150),
                PokemonTypeUtils.getColor(type.toLowerCase()),
              ],
            ),
            borderRadius: BorderRadiusGeometry.only(
              bottomLeft: Radius.elliptical(250, 125),
              bottomRight: Radius.elliptical(250, 125),
            ),
          ),
          child: ShaderImage(
            imagePath: PokemonTypeUtils.getTypeImage(type),
            colors: [PokemonTypeUtils.getColor(type), Colors.white],
            verticalPadding: 30,
          ),
        ),
        SizedBox(
          height: 307,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.network(
                  animatedUrl,
                  height: height,
                  width: 250,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Image.network(
                    staticImageUrl,
                    height: height,
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
