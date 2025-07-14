// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/controllers/pokemon_controller.dart' as _i201;
import '../../features/home/repositories/pokemon_repository.dart' as _i691;
import '../../features/home/services/pokemon_cache_service.dart' as _i160;
import '../../features/onboarding/controllers/onboarding_controller.dart'
    as _i426;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i426.OnboardingController>(() => _i426.OnboardingController());
  gh.lazySingleton<_i160.PokemonCacheService>(
      () => _i160.PokemonCacheService());
  gh.lazySingleton<_i691.PokemonRepository>(
      () => _i691.PokemonRepository(gh<_i160.PokemonCacheService>()));
  gh.lazySingleton<_i201.PokemonController>(
      () => _i201.PokemonController(gh<_i691.PokemonRepository>()));
  return getIt;
}
