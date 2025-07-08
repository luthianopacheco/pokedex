import 'dart:async';
import 'package:flutter/material.dart';

class SplashController {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  SplashController(vsync) {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: vsync,
    );

    _animation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(-0.05, 0),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(-0.05, 0),
          end: const Offset(3.0, 0),
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 50,
      ),
    ]).animate(_controller);
  }

  Animation<Offset> get animation => _animation;

  void start(VoidCallback onComplete) {
    _controller.forward();
    Timer(const Duration(milliseconds: 1000), onComplete);
  }

  void dispose() => _controller.dispose();
}
