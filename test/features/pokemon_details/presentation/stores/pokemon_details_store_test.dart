import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/features/pokemon_details/presentation/stores/pokemon_details_store.dart';
import 'package:pokedex/shared/data/models/pokemon_data.dart';
import 'package:pokedex/features/pokemon_details/domain/models/evolution_chain.dart';

void main() {
  late PokemonDetailsStore store;

  setUp(() {
    store = PokemonDetailsStore();
  });

  final pokemonData = PokemonData(id: 1, name: 'Bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/');
  final evolutionChain = EvolutionChain(id: 1, evolutions: []);

  group('PokemonDetailsStore', () {
    test('Deve inicializar com estados nulos e isLoading falso', () {
      expect(store.pokemon, isNull);
      expect(store.evolutionChain, isNull);
      expect(store.isLoading, isFalse);
    });

    test('A action setPokemon deve atualizar a propriedade pokemon', () {
      store.setPokemon(pokemonData);
      expect(store.pokemon, equals(pokemonData));
    });

    test('A action setEvolutionChain deve atualizar a propriedade evolutionChain', () {
      store.setEvolutionChain(evolutionChain);
      expect(store.evolutionChain, equals(evolutionChain));
    });

    test('A action setLoading deve alternar a propriedade isLoading', () {
      store.setLoading(true);
      expect(store.isLoading, isTrue);

      store.setLoading(false);
      expect(store.isLoading, isFalse);
    });
  });
}