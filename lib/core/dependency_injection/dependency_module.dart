import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DependencyModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2/"));

  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
