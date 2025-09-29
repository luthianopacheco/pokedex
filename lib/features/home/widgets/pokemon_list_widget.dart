import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/features/home/controllers/pokemon_controller.dart';
import 'package:pokedex/features/home/widgets/pokemon_card/pokemon_card.dart';
import 'package:pokedex/shared/utils/pokemons/pokemon_utils.dart';
import 'package:pokedex/shared/widgets/loading/pokeball_loading_indicator.dart';

class PokemonList extends StatelessWidget {
  final PokemonController controller;
  final ScrollController scrollController;
  const PokemonList({
    super.key,
    required this.controller,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final pokemons = controller.pokemons;
        final plus = controller.isLoadingMore ? 1 : 0;

        if (pokemons.isEmpty && !controller.isLoading) {
          final selectedType = controller.selectedType?.type ?? 'all';
          final message = selectedType != 'all'
              ? ' para o tipo "${PokemonTypeUtils.getLabel(selectedType)}"'
              : '';

          return Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: Text('Nenhum Pokémon encontrado$message')),
          );
        }

        return Expanded(
          child: ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: pokemons.length + plus,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              if (index < pokemons.length) {
                return PokemonCard(pokemon: pokemons[index]);
              } else {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: PokeballLoadingIndicator()),
                );
              }
            },
          ),
        );
      },
    );
  }
}
