import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/theme/app_colors.dart';
import 'package:pokedex/features/splash/splash_controller.dart';
import 'package:pokedex/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late SplashController _controller;

  @override
  void initState() {
    super.initState();

    _controller = SplashController(this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await precacheImage(
        AssetImage(Assets.splash.splashPokedex.path),
        context,
      );
      _controller.start(() => context.go('/onboarding'));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSplashScreen,
      body: Center(
        child: SlideTransition(
          position: _controller.animation,
          child: Assets.splash.splashPokedex.image(width: 280),
        ),
      ),
    );
  }
}
