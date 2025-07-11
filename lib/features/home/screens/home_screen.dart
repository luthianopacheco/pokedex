import 'package:flutter/material.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/features/home/controllers/pokemon_controller.dart';
import 'package:pokedex/shared/widgets/textfields/custom_search_field.dart';
import 'package:pokedex/features/home/widgets/filter_buttons/filter_buttons.dart';
import 'package:pokedex/features/home/widgets/pokemon_list_widget.dart';
import 'package:pokedex/shared/widgets/appbar/custom_appbar.dart';
import 'package:pokedex/shared/widgets/status_widgets/async_status_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = getIt<PokemonController>();
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (!_scrollController.hasClients || _controller.isLoadingMore) return;

        final position = _scrollController.position;
        final threshold = position.maxScrollExtent - 200;

        if (position.pixels >= threshold) {
          _controller.handleScrollTrigger(() {
            _controller.getPokemons();
          });
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.init(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: CustomAppBar(
            appBarPreferredSize: 32,
            bottomContent: CustomSearchField(
              hintText: 'Procurar Pokémon',
              onChanged: (value) {},
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                FilterButtons(controller: _controller),
                const SizedBox(height: 10),
                AsyncStatusHandler(
                  isLoading: _controller.isLoading,
                  hasError: _controller.hasError,
                  errorMessage: _controller.errorMessage,
                  onRetry: () {
                    _controller.clearError();
                    _controller.getPokemons();
                  },
                  child: PokemonList(
                    controller: _controller,
                    scrollController: _scrollController,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
