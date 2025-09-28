import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/features/pokemon_details/controllers/pokemon_details_controller.dart';
import 'package:pokedex/features/pokemon_details/widgets/details_content.dart';

import 'package:pokedex/shared/widgets/status_widgets/async_status_handler.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final int id;
  PokemonDetailsScreen({super.key, required this.id});
  final _controller = getIt<PokemonDetailsController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.getPokemonDetails(id: id),
      builder: (context, snapshot) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Observer(
                builder: (context) {
                  return AsyncStatusHandler(
                    isLoading: _controller.isLoading,
                    hasError: _controller.hasError,
                    errorMessage: _controller.errorMessage,
                    onRetry: () {
                      _controller.clearError();
                      _controller.getPokemonDetails(id: id);
                    },
                    child: DetailsContent(),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
