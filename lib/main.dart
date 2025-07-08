import 'package:flutter/material.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  setUrlStrategy(PathUrlStrategy());
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}
