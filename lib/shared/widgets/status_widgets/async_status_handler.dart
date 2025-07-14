import 'package:flutter/material.dart';
import 'package:pokedex/shared/widgets/buttons/custom_filled_button.dart';

class AsyncStatusHandler extends StatelessWidget {
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;
  final VoidCallback onRetry;
  final Widget child;

  const AsyncStatusHandler({
    super.key,
    required this.isLoading,
    required this.hasError,
    required this.errorMessage,
    required this.onRetry,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    }

    if (hasError) {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildErrorMessge(context, errorMessage ?? 'Erro inesperado'),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 300),
                child: CustomButton(
                  isFilled: false,
                  onPressed: onRetry,
                  textWidget: const Text('Tentar novamente'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return child;
  }

  Widget _buildErrorMessge(BuildContext context, String message) {
    return Text(
      message,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.red),
      textAlign: TextAlign.center,
    );
  }
}
