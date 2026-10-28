import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/features/pokemon_details/domain/use_cases/get_pokemon_details_usecase.dart';
import 'package:pokedex/features/pokemon_details/presentation/stores/pokemon_details_store.dart';

import '../../../../test_config/test_config.dart';

void main() {
  late MockPokemonDetailsRepository mockRepository;
  late PokemonDetailsStore store;
  late GetPokemonDetailsUseCase useCase;

  setUpAll(registerFallbacks);

  setUp(() {
    mockRepository = MockPokemonDetailsRepository();
    store = PokemonDetailsStore();
    useCase = GetPokemonDetailsUseCase(mockRepository, store);
  });

  const id = tPokemonId;
  final result = tPokemonWithEvolutions;

  group('GetPokemonDetailsUseCase', () {
    test(
      'Deve chamar o repository e atualizar a store em caso de sucesso',
      () async {
        when(
          () => mockRepository.getAndCachePokemonDetails(id: any(named: 'id')),
        ).thenAnswer((_) async => result);

        await useCase.execute(id: id);

        verify(
          () => mockRepository.getAndCachePokemonDetails(id: id),
        ).called(1);

        expect(store.pokemon, equals(result.pokemon));
        expect(store.evolutionChain, equals(result.evolutionChain));
      },
    );

    test(
      'Deve garantir que o isLoading é gerenciado (ligado e desligado)',
      () async {
        when(
          () => mockRepository.getAndCachePokemonDetails(id: any(named: 'id')),
        ).thenAnswer((_) async {
          expect(store.isLoading, isTrue);
          return result;
        });

        expect(store.isLoading, isFalse);
        await useCase.execute(id: id);
        expect(store.isLoading, isFalse);
      },
    );

    test(
      'Deve lançar a exceção do repository e garantir que o isLoading é desligado',
      () async {
        final tException = Exception('Erro de rede simulado');
        when(
          () => mockRepository.getAndCachePokemonDetails(id: any(named: 'id')),
        ).thenThrow(tException);

        await expectLater(useCase.execute(id: id), throwsA(tException));
        expect(store.isLoading, isFalse);
      },
    );
  });
}
