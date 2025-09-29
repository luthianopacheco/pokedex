import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/features/home/presentation/controllers/home_controller.dart';
import 'package:pokedex/features/home/presentation/widgets/filter_buttons/selector_button.dart';

class FilterButtons extends StatelessWidget {
  final HomeController controller;
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
                items: controller.store.pokemonTypes,
                selectedItem: controller.store.selectedType,
                onSelected: controller.setSelectedType,
              );
            },
          ),
          const SizedBox(width: 10),
          Observer(
            builder: (context) {
              return SelectorButton(
                modalTitle: 'Ordenar por',
                items: controller.store.orderOptions,
                selectedItem: controller.store.selectedOrder,
                onSelected: controller.setSelectedOrder,
              );
            },
          ),
        ],
      ),
    );
  }
}
