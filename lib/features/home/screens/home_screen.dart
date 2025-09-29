import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/features/home/controllers/pokemon_controller.dart';
import 'package:pokedex/shared/widgets/textfields/custom_search_field.dart';
import 'package:pokedex/features/home/widgets/filter_buttons/filter_buttons.dart';
import 'package:pokedex/features/home/widgets/pokemon_list_widget.dart';
import 'package:pokedex/shared/widgets/appbar/custom_appbar.dart';
import 'package:pokedex/shared/widgets/status/async_status_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = getIt<PokemonController>();
  late final TextEditingController _searchController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: _controller.searchPokemon);

    _scrollController = ScrollController()
      ..addListener(() {
        if (!_scrollController.hasClients || _controller.isLoadingMore) return;

        final position = _scrollController.position;
        final threshold = position.maxScrollExtent - 200;

        if (position.pixels >= threshold && !_controller.isLoadingMore) {
          _controller.loadMorePokemons();
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
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
              controller: _searchController,
              onChanged: (value) => _controller.setSearchPokemon(value),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                FilterButtons(controller: _controller),
                const SizedBox(height: 10),
                Observer(
                  builder: (context) {
                    return AsyncStatusHandler(
                      isLoading: _controller.isLoading,
                      hasError: _controller.hasError,
                      errorMessage: _controller.errorMessage,
                      onRetry: () {
                        _controller.clearError();
                        _controller.init();
                      },
                      child: PokemonList(
                        controller: _controller,
                        scrollController: _scrollController,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
