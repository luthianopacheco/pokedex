import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/features/home/controllers/pokemon_controller.dart';
import 'package:pokedex/features/home/widgets/pokemon_card/pokemon_card.dart';

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
        final isSearching = controller.searchPokemon.isNotEmpty;
        final plus = controller.isLoadingMore ? 1 : 0;
        final list = isSearching
            ? controller.searchResults
            : controller.pokemons;

        return Expanded(
          child: ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: list.length + plus,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              if (isSearching && list.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('Nenhum Pokémon encontrado'),
                  ),
                );
              } else if (index < list.length) {
                return PokemonCard(pokemon: list[index]);
              } else {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        );
      },
    );
  }
}
