import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pokedex/core/routes/routes.dart';
import 'package:pokedex/core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp.router(
      title: 'Pokédex',
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.appRoutes,
      theme: AppTheme.lightTheme,
    );
  }
}
