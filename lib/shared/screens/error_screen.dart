import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/core/stores/app_error_store.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/shared/utils/helper/screen_helper.dart';
import 'package:pokedex/shared/widgets/buttons/custom_filled_button.dart';
import 'package:pokedex/shared/widgets/loading/pokeball_loading_indicator.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen({super.key});
  final _appErrorStore = getIt<AppErrorStore>();

  Future<void> _retryAndNavigate(BuildContext context) async {
    _appErrorStore.setRetryingStatus(true);
    try {
      final retry = _appErrorStore.globalErrorRetryCallback;
      if (retry != null) {
        await retry();
      } else {
        _appErrorStore.clearGlobalError();
      }
    } catch (e) {
      debugPrint('Erro durante nova tentativa de requisição: $e');
    } finally {
      await Future.delayed(Duration(seconds: 1));
      _appErrorStore.setRetryingStatus(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenHelper.height(context);
    return Scaffold(
      body: Observer(
        builder: (context) {
          final errorTitle = _appErrorStore.globalErrorTitle;
          final errorMessage = _appErrorStore.globalErrorMessage;

          return SingleChildScrollView(
            child: SizedBox(
              height: screenHeight - 80,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Assets.images.generalImages.error.image(height: 300),
                    Text(
                      errorTitle ?? 'Erro inesperado',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      errorMessage ??
                          'Estamos trabalhando para solucionar o problema e oferecer uma melhor experiência.\nTente novamente mais tarde!',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),

                    _appErrorStore.isRetrying
                        ? Center(child: PokeballLoadingIndicator())
                        : ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 300),
                            child: CustomButton(
                              isFilled: false,
                              onPressed: () => _retryAndNavigate(context),
                              textWidget: Text('Tentar novamente'),
                            ),
                          ),

                    IconButton(
                      onPressed: () async {
                        _appErrorStore.setRetryingStatus(true);
                        await Future.delayed(Duration(seconds: 1));
                        _appErrorStore.clearGlobalError();
                        _appErrorStore.setRetryingStatus(false);
                      },
                      color: Theme.of(context).colorScheme.secondary,
                      icon: Icon(Icons.home),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
