import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/core/theme/app_colors.dart';
import 'package:pokedex/features/home/presentation/controllers/home_controller.dart';

class CustomSearchField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  CustomSearchField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.controller,
  });

  final _controller = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final showClearButton = _controller.store.searchPokemon.isNotEmpty;

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: controller,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              prefixIcon: const Icon(Icons.search, size: 24),
              suffixIcon: !showClearButton
                  ? null
                  : IconButton(
                      onPressed: () {
                        controller?.clear();
                        _controller.setSearchPokemon('');
                      },
                      icon: Icon(Icons.close),
                    ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: AppColors.disabledColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: AppColors.disabledColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              isDense: true,
            ),
            textCapitalization: TextCapitalization.words,
            onChanged: onChanged,
          ),
        );
      },
    );
  }
}
