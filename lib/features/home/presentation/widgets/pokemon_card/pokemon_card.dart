import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/home/presentation/widgets/pokemon_card/image_content_card.dart';
import 'package:pokedex/features/home/presentation/widgets/pokemon_card/text_content_card.dart';
import 'package:pokedex/shared/domain/models/pokemon.dart';
import 'package:pokedex/shared/utils/pokemons/pokemon_utils.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return _buildCard(
      child: InkWell(
        onTap: () => context.goNamed(
          'pokemon_details',
          pathParameters: {'id': pokemon.id.toString()},
        ),
        child: Row(
          children: [
            TextContentCard(pokemon: pokemon),
            ImageContentCard(
              imageUrl: pokemon.imageUrl,
              type: pokemon.types.first,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: PokemonTypeUtils.getColor(
          pokemon.types.first,
        ).withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
