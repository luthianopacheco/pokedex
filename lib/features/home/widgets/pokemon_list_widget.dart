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
        return Expanded(
          child: ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.only(bottom: 80),
            itemCount:
                controller.pokemons.length + (controller.isLoadingMore ? 1 : 0),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              if (index < controller.pokemons.length) {
                return PokemonCard(pokemon: controller.pokemons[index]);
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
