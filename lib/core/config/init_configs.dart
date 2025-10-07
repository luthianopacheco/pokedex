import 'package:flutter/material.dart';
import 'package:pokedex/core/config/hive_configs.dart';
import 'package:pokedex/core/dependency_injection/init_injections.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class InitConfigs {
  static run() async {
    /// Garante a inicialização
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    /// Injeção de dependencias
    configureDependencies();

    /// Injeções iniciais
    await InitInjections.run();

    /// Cache
    await HiveConfigs.run();

    /// Retira o "/#/" da URL web
    setUrlStrategy(PathUrlStrategy());

    /// Carrega a SplashScreen
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }
}
