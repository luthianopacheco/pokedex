import 'package:flutter/material.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}
