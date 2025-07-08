import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenTransitions {
  /// Transição com deslizamento da direita para a esquerda.
  static CustomTransitionPage slideFromRight({
    required Widget child,
    required GoRouterState state,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }

  /// Transição com fade-in suave.
  static CustomTransitionPage fadeIn({
    required Widget child,
    required GoRouterState state,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 1000),
      fullscreenDialog: true,
    );
  }

  /// Transição de entrada com deslizamento de baixo para cima.
  static CustomTransitionPage slideUpIn({
    required Widget child,
    required GoRouterState state,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final slideUp = Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.elasticIn));

        return SlideTransition(position: slideUp, child: child);
      },
      transitionDuration: const Duration(milliseconds: 1000),
      fullscreenDialog: true,
    );
  }

  /// Transição composta: entrada com fade-in e saída com slide para cima.
  static PageRouteBuilder slideUpOutNavigator({required Widget child}) {
    return PageRouteBuilder(
      opaque: false,
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final fadeIn = CurvedAnimation(parent: animation, curve: Curves.easeIn);
        final slideUp =
            Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.0, -0.5),
            ).animate(
              CurvedAnimation(
                parent: secondaryAnimation,
                curve: Curves.elasticIn,
              ),
            );

        return SlideTransition(
          position: slideUp,
          child: FadeTransition(opacity: fadeIn, child: child),
        );
      },
    );
  }
}
