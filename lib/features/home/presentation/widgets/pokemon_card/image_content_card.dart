import 'package:flutter/material.dart';
import 'package:pokedex/shared/utils/color/color_utils.dart';
import 'package:pokedex/shared/utils/pokemons/pokemon_utils.dart';
import 'package:pokedex/shared/widgets/images/shader_image.dart';

class ImageContentCard extends StatelessWidget {
  final String imageUrl;
  final String type;
  const ImageContentCard({
    super.key,
    required this.imageUrl,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        _card(child: Stack(children: [_backgroundImage(), _pokemonImage()])),
        // _favIconButton(),
      ],
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      width: 126,
      height: 102,
      decoration: BoxDecoration(
        color: PokemonTypeUtils.getColor(type.toLowerCase()),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }

  Widget _backgroundImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ShaderImage(
          imagePath: PokemonTypeUtils.getTypeImage(type),
          colors: [PokemonTypeUtils.getColor(type.toLowerCase()), Colors.white],
        ),
      ),
    );
  }

  Widget _pokemonImage() {
    return Center(
      child: Image.network(
        imageUrl,
        errorBuilder: (context, error, stackTrace) => Text(
          'Indisponível',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: PokemonTypeUtils.getColor(type).contrastColor,
          ),
        ),
      ),
    );
  }

  // Widget _favIconButton() {
  //   return IconButton(
  //     icon: Image.asset('assets/icons/general_icons/fav-2-unselected.png'),
  //     onPressed: () {},
  //     color: Colors.white,
  //   );
  // }
}
