import 'package:flutter/material.dart';
import 'package:pokedex/shared/widgets/loading/pokeball_loading_indicator.dart';

class AsyncStatusHandler extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final bool wrapLoadingWithExpanded;

  const AsyncStatusHandler({
    super.key,
    required this.isLoading,
    required this.child,
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

    return child;
  }
}
