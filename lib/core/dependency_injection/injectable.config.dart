// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/controllers/pokemon_controller.dart' as _i201;
import '../../features/home/repositories/pokemon_repository.dart' as _i691;
import '../../features/home/services/pokemon_cache_service.dart' as _i160;
import '../../features/onboarding/controllers/onboarding_controller.dart'
    as _i426;
import '../../features/pokemon_details/data/datasources/evolutions_cache_service.dart'
    as _i511;
import '../../features/pokemon_details/data/repositories/pokemon_details_repository_impl.dart'
    as _i595;
import '../../features/pokemon_details/domain/repositories/i_pokemon_details_repository.dart'
    as _i128;
import '../../features/pokemon_details/domain/use_cases/get_pokemon_details_usecase.dart'
    as _i861;
import '../../features/pokemon_details/presentation/controllers/pokemon_details_controller.dart'
    as _i516;
import '../../features/pokemon_details/presentation/stores/pokemon_details_store.dart'
    as _i825;
import '../../features/profile/controllers/profile_controller.dart' as _i521;
import '../config/dio_config.dart' as _i356;

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
  final dioModule = _$DioModule();
  gh.factory<_i426.OnboardingController>(() => _i426.OnboardingController());
  gh.lazySingleton<_i160.PokemonCacheService>(
      () => _i160.PokemonCacheService());
  gh.lazySingleton<_i521.ProfileController>(() => _i521.ProfileController());
  gh.lazySingleton<_i825.PokemonDetailsStore>(
      () => _i825.PokemonDetailsStore());
  gh.lazySingleton<_i511.EvolutionChainCacheService>(
      () => _i511.EvolutionChainCacheService());
  gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
  gh.lazySingleton<_i691.PokemonRepository>(
      () => _i691.PokemonRepository(gh<_i160.PokemonCacheService>()));
  gh.lazySingleton<_i201.PokemonController>(
      () => _i201.PokemonController(gh<_i691.PokemonRepository>()));
  gh.lazySingleton<_i128.IPokemonDetailsRepository>(
      () => _i595.PokemonDetailsRepositoryImpl(
            gh<_i160.PokemonCacheService>(),
            gh<_i511.EvolutionChainCacheService>(),
            gh<_i361.Dio>(),
          ));
  gh.factory<_i861.GetPokemonDetailsUseCase>(
      () => _i861.GetPokemonDetailsUseCase(
            gh<_i128.IPokemonDetailsRepository>(),
            gh<_i825.PokemonDetailsStore>(),
          ));
  gh.lazySingleton<_i516.PokemonDetailsController>(
      () => _i516.PokemonDetailsController(
            gh<_i825.PokemonDetailsStore>(),
            gh<_i861.GetPokemonDetailsUseCase>(),
          ));
  return getIt;
}

class _$DioModule extends _i356.DioModule {}
