import 'package:flutter/material.dart';
import 'package:pokedex/core/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.appRoutes,
    );
  }
}
