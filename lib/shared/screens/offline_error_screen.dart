import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/core/stores/connectivity_store.dart';
import 'package:pokedex/shared/utils/helper/screen_helper.dart';
import 'package:pokedex/shared/widgets/buttons/custom_filled_button.dart';
import 'package:pokedex/shared/widgets/loading/pokeball_loading_indicator.dart';

class OfflineErrorScreen extends StatelessWidget {
  OfflineErrorScreen({super.key});
  final _connectivityStore = getIt<ConnectivityStore>();

  Future<void> _checkAndNavigate(BuildContext context) async {
    _connectivityStore.setCheckingStatus(true);
    if (_connectivityStore.isConnected) {
      if (context.mounted) {
        context.go('/');
      } else {
        _connectivityStore.setCheckingStatus(false);
      }
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
              Image.asset('assets/images/general_images/no-wifi.png'),
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
                        ? PokeballLoadingIndicator()
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
