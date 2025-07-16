import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/features/home/controllers/pokemon_controller.dart';
import 'package:pokedex/features/home/widgets/filter_buttons/selector_button.dart';

class FilterButtons extends StatelessWidget {
  final PokemonController controller;
  const FilterButtons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Row(
        children: [
          Observer(
            builder: (context) {
              return SelectorButton(
                modalTitle: 'Selecione o tipo',
                items: controller.pokemonTypes,
                selectedItem: controller.selectedType,
                onSelected: controller.setSelectedType,
              );
            },
          ),
          const SizedBox(width: 10),
          Observer(
            builder: (context) {
              return SelectorButton(
                modalTitle: 'Ordenar por',
                items: controller.orderOptions,
                selectedItem: controller.selectedOrder,
                onSelected: controller.setSelectedOrder,
              );
            },
          ),
        ],
      ),
    );
  }
}
