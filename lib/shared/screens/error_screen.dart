import 'package:flutter/material.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/shared/utils/helper/screen_helper.dart';
import 'package:pokedex/shared/widgets/buttons/custom_filled_button.dart';

class ErrorScreen extends StatelessWidget {
  final String? errorTitle;
  final String? errorMessage;
  final Widget? buttonTitleWidget;
  final VoidCallback onRetry;
  const ErrorScreen({
    super.key,
    this.errorTitle,
    this.buttonTitleWidget = const Text('Tentar novamente'),
    this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenHelper.height(context);
    return Scaffold(
      body: SingleChildScrollView(
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
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: CustomButton(
                    isFilled: false,
                    onPressed: onRetry,
                    textWidget: buttonTitleWidget,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
