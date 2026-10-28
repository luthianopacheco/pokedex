import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/stores/app_error_store.dart';

void main() {
  late AppErrorStore store;

  setUp(() {
    store = AppErrorStore();
  });

  tearDown(() {
    store.clearGlobalError();
  });

  group('AppErrorStore', () {
    test('Deve começar limpo, sem erro e sem status de retrying', () {
      expect(store.globalErrorMessage, isNull);
      expect(store.isRetrying, isFalse);
    });

    test('A action setRetryingStatus deve alterar corretamente o estado', () {
      store.setRetryingStatus(true);
      expect(store.isRetrying, isTrue);
      
      store.setRetryingStatus(false);
      expect(store.isRetrying, isFalse);
    });

    test('A action setGlobalError deve armazenar o título e a mensagem de erro', () async {
      int retryCount = 0;
      Future<void> mockRetry() async {
        retryCount++;
      }

      await store.setGlobalError(
        'Titulo',
        'Mensagem de erro',
        onRetry: mockRetry,
      );

      expect(store.globalErrorTitle, equals('Titulo'));
      expect(store.globalErrorMessage, equals('Mensagem de erro'));
      expect(store.globalErrorRetryCallback, isNotNull);
      
      await store.globalErrorRetryCallback!(); 
      expect(retryCount, equals(1));
    });

    test('A action clearGlobalError deve limpar todos os estados de erro', () async {
      await store.setGlobalError(
        'Titulo',
        'Mensagem de erro',
        onRetry: () async {},
      );

      store.clearGlobalError();

      expect(store.globalErrorTitle, isNull);
      expect(store.globalErrorMessage, isNull);
      expect(store.globalErrorRetryCallback, isNull);
    });
  });
}