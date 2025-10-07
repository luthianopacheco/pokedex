import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/core/stores/app_error_store.dart';
import 'package:pokedex/core/stores/connectivity_store.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/shared/utils/helper/screen_helper.dart';
import 'package:pokedex/shared/widgets/buttons/custom_filled_button.dart';
import 'package:pokedex/shared/widgets/loading/pokeball_loading_indicator.dart';

class OfflineErrorScreen extends StatelessWidget {
  OfflineErrorScreen({super.key});
  final _connectivityStore = getIt<ConnectivityStore>();
  final _appErrorStore = getIt<AppErrorStore>();

  Future<void> _checkAndNavigate(BuildContext context) async {
    _connectivityStore.setCheckingStatus(true);
    try {
      if (_connectivityStore.isConnected) {
        final retry = _appErrorStore.globalErrorRetryCallback;

        if (retry != null) {
          retry();
        } else {
          _appErrorStore.clearGlobalError();
        }
      }
    } catch (e) {
      debugPrint('Erro durante a checagem e navegação: $e');
    } finally {
      await Future.delayed(Duration(seconds: 1));
      _connectivityStore.setCheckingStatus(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenHelper.height(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight - 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Assets.images.generalImages.noWifi.image(),
              const SizedBox(height: 20),
              Text(
                'Sem Conexão com a Internet',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Verifique sua conexão e tente novamente.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Observer(
                  builder: (context) {
                    return _connectivityStore.isChecking
                        ? Center(child: PokeballLoadingIndicator())
                        : CustomButton(
                            isFilled: false,
                            textWidget: const Text('Tentar Novamente'),
                            onPressed: () => _checkAndNavigate(context),
                          );
                  },
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
