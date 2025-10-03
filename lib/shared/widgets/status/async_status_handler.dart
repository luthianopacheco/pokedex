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
  final bool wrapLoadingWithExpanded;

  const AsyncStatusHandler({
    super.key,
    required this.isLoading,
    required this.hasError,
    required this.errorMessage,
    required this.onRetry,
    required this.child,
    this.errorTitle,
    this.wrapLoadingWithExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      final loading = Center(child: PokeballLoadingIndicator());
      if (wrapLoadingWithExpanded) {
        return Expanded(child: loading);
      }
      return loading;
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
