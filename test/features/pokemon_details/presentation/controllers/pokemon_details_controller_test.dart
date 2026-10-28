import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/features/pokemon_details/presentation/controllers/pokemon_details_controller.dart';
import 'package:pokedex/features/pokemon_details/presentation/stores/pokemon_details_store.dart';

import '../../../../test_config/test_config.dart';

void main() {
  late MockAppErrorStore mockErrorStore;
  late MockGetPokemonDetailsUseCase mockUseCase;
  late PokemonDetailsStore store;
  late PokemonDetailsController controller;

  setUpAll(registerFallbacks);

  setUp(() {
    mockErrorStore = MockAppErrorStore();
    mockUseCase = MockGetPokemonDetailsUseCase();
    store = PokemonDetailsStore();

    controller = PokemonDetailsController(store, mockUseCase, mockErrorStore);

    when(
      () => mockErrorStore.clearGlobalError(),
    ).thenAnswer((_) async => Future.value());

    when(
      () => mockErrorStore.setGlobalError(
        any(),
        any(),
        onRetry: any(named: 'onRetry'),
      ),
    ).thenAnswer((_) async => Future.value());
  });

  const id = tPokemonId;
  final result = tPokemonWithEvolutions;

  group('PokemonDetailsController', () {
    test(
      'Deve limpar o erro global e chamar o UseCase em caso de sucesso',
      () async {
        when(() => mockUseCase.execute(id: id)).thenAnswer((_) async => result);

        await controller.getPokemonDetails(id: id);

        verify(() => mockErrorStore.clearGlobalError()).called(1);

        verify(() => mockUseCase.execute(id: id)).called(1);

        verifyNever(() => mockErrorStore.setGlobalError(any(), any()));
      },
    );

    test(
      'Deve chamar o setGlobalError com o callback de retry em caso de falha',
      () async {
        final tException = Exception('Erro de teste');
        var isFirstCall = true;

        when(() => mockUseCase.execute(id: id)).thenAnswer((invocation) async {
          if (isFirstCall) {
            isFirstCall = false;
            throw tException;
          }
          return Future.value();
        });

        await controller.getPokemonDetails(id: id);

        final captured = verify(
          () => mockErrorStore.setGlobalError(
            any(),
            any(),
            onRetry: captureAny(named: 'onRetry'),
          ),
        ). captured.single;

        final onRetryCallback = captured as Future<void> Function();

        await onRetryCallback();

        verify(() => mockUseCase.execute(id: id)).called(2);
      },
    );
  });
}
