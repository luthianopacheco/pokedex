import 'package:flutter/material.dart';
import 'package:pokedex/shared/screens/error_screen.dart';
import 'package:pokedex/shared/widgets/loading/pokeball_loading_indicator.dart';

class AsyncStatusHandler extends StatelessWidget {
  final bool isLoading;
  final bool hasError;
  final String? errorTitle;
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
    this.errorTitle,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Expanded(child: Center(child: PokeballLoadingIndicator()));
    }

    if (hasError) {
      return ErrorScreen(
        errorTitle: errorTitle,
        errorMessage: errorMessage,
        onRetry: onRetry,
      );
    }

    return child;
  }
}
