import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/features/pokemon_details/presentation/controllers/pokemon_details_controller.dart';
import 'package:pokedex/features/pokemon_details/presentation/widgets/details_content.dart';
import 'package:pokedex/shared/widgets/status/async_status_handler.dart';

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
          body: Observer(
            builder: (context) {
              return AsyncStatusHandler(
                isLoading: _controller.store.isLoading,
                hasError: _controller.store.hasError,
                errorMessage: _controller.store.errorMessage,
                onRetry: () {
                  _controller.store.clearError();
                  _controller.getPokemonDetails(id: id);
                },
                child: SingleChildScrollView(child: DetailsContent()),
              );
            },
          ),
        );
      },
    );
  }
}
