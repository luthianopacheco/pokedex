import 'package:flutter/material.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/core/theme/app_colors.dart';
import 'package:pokedex/features/pokemon_details/presentation/controllers/pokemon_details_controller.dart';
import 'package:pokedex/features/pokemon_details/presentation/widgets/abilities_and_weaknesses/abilities_and_weaknesses.dart';
import 'package:pokedex/features/pokemon_details/presentation/widgets/evolution/evolution_chain_widget.dart';
import 'package:pokedex/features/pokemon_details/presentation/widgets/header/details_appbar.dart';
import 'package:pokedex/features/pokemon_details/presentation/widgets/stats/base_stats.dart';
import 'package:pokedex/features/pokemon_details/presentation/widgets/header/details_header.dart';
import 'package:pokedex/features/pokemon_details/presentation/widgets/type_and_description/type_and_description.dart';

class DetailsContent extends StatelessWidget {
  DetailsContent({super.key});
  final _controller = getIt<PokemonDetailsController>();

  @override
  Widget build(BuildContext context) {
    final pokemon = _controller.store.pokemon;
    final evolutions = _controller.store.evolutionChain?.evolutions;

    if (pokemon == null) {
      return Column(
        children: [
          DetailsAppbar(iconsColor: Theme.of(context).colorScheme.onSurface),
          Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text('Não foram encontrados detalhes do Pokémon!'),
            ),
          ),
        ],
      );
    }

    return Column(
      spacing: 16,
      children: [
        DetailsHeader(pokemon: pokemon),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              TypeAndDescription(
                types: pokemon.types ?? [],
                description: pokemon.description ?? '',
              ),
              Divider(color: AppColors.disabledColorLight),
              BaseStats(pokemon: pokemon),
              const SizedBox(height: 5),
              AbilitiesAndWeaknesses(
                abilities: pokemon.abilities ?? [],
                weaknesses: pokemon.weaknesses ?? [],
              ),
              const SizedBox(height: 5),
              if (evolutions != null && evolutions.isNotEmpty)
                EvolutionChainWidget(evolutions: evolutions),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );
  }
}
