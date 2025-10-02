// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/datasources/pokemon_cache_service.dart'
    as _i642;
import '../../features/home/data/repositories/home_repository.dart' as _i736;
import '../../features/home/domain/repositories/i_home_repository.dart'
    as _i274;
import '../../features/home/domain/use_cases/fetch_pokemon_page_usecase.dart'
    as _i759;
import '../../features/home/domain/use_cases/get_filtered_pokemon_ids_usecase.dart'
    as _i792;
import '../../features/home/domain/use_cases/get_pokemon_names_by_type_usecase.dart'
    as _i887;
import '../../features/home/domain/use_cases/initialize_pokemon_data_usecase.dart'
    as _i183;
import '../../features/home/domain/use_cases/load_filter_options_usecase.dart'
    as _i405;
import '../../features/home/presentation/controllers/home_controller.dart'
    as _i414;
import '../../features/home/presentation/stores/home_store.dart' as _i26;
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
import '../stores/connectivity_store.dart' as _i1045;
import 'dependency_module.dart' as _i241;

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
  final dependencyModule = _$DependencyModule();
  gh.factory<_i426.OnboardingController>(() => _i426.OnboardingController());
  gh.lazySingleton<_i642.PokemonCacheService>(
      () => _i642.PokemonCacheService());
  gh.lazySingleton<_i26.HomeStore>(() => _i26.HomeStore());
  gh.lazySingleton<_i511.EvolutionChainCacheService>(
      () => _i511.EvolutionChainCacheService());
  gh.lazySingleton<_i825.PokemonDetailsStore>(
      () => _i825.PokemonDetailsStore());
  gh.lazySingleton<_i521.ProfileController>(() => _i521.ProfileController());
  gh.lazySingleton<_i361.Dio>(() => dependencyModule.dio);
  gh.lazySingleton<_i895.Connectivity>(() => dependencyModule.connectivity);
  gh.lazySingleton<_i128.IPokemonDetailsRepository>(
      () => _i595.PokemonDetailsRepositoryImpl(
            gh<_i642.PokemonCacheService>(),
            gh<_i511.EvolutionChainCacheService>(),
            gh<_i361.Dio>(),
          ));
  gh.lazySingleton<_i274.IHomeRepository>(() => _i736.HomeRepositoryImpl(
        gh<_i642.PokemonCacheService>(),
        gh<_i361.Dio>(),
      ));
  gh.lazySingleton<_i1045.ConnectivityStore>(
      () => _i1045.ConnectivityStore(gh<_i895.Connectivity>()));
  gh.factory<_i861.GetPokemonDetailsUseCase>(
      () => _i861.GetPokemonDetailsUseCase(
            gh<_i128.IPokemonDetailsRepository>(),
            gh<_i825.PokemonDetailsStore>(),
          ));
  gh.factory<_i759.FetchPokemonPageUseCase>(
      () => _i759.FetchPokemonPageUseCase(gh<_i274.IHomeRepository>()));
  gh.factory<_i792.GetFilteredPokemonIdsUseCase>(
      () => _i792.GetFilteredPokemonIdsUseCase(gh<_i274.IHomeRepository>()));
  gh.factory<_i887.GetPokemonNamesByTypeUseCase>(
      () => _i887.GetPokemonNamesByTypeUseCase(gh<_i274.IHomeRepository>()));
  gh.factory<_i183.InitializePokemonDataUseCase>(
      () => _i183.InitializePokemonDataUseCase(gh<_i274.IHomeRepository>()));
  gh.factory<_i405.LoadFilterOptionsUseCase>(
      () => _i405.LoadFilterOptionsUseCase(gh<_i274.IHomeRepository>()));
  gh.lazySingleton<_i516.PokemonDetailsController>(
      () => _i516.PokemonDetailsController(
            gh<_i825.PokemonDetailsStore>(),
            gh<_i861.GetPokemonDetailsUseCase>(),
          ));
  gh.lazySingleton<_i414.HomeController>(() => _i414.HomeController(
        gh<_i26.HomeStore>(),
        gh<_i759.FetchPokemonPageUseCase>(),
        gh<_i792.GetFilteredPokemonIdsUseCase>(),
        gh<_i887.GetPokemonNamesByTypeUseCase>(),
        gh<_i183.InitializePokemonDataUseCase>(),
        gh<_i405.LoadFilterOptionsUseCase>(),
      ));
  return getIt;
}

class _$DependencyModule extends _i241.DependencyModule {}
