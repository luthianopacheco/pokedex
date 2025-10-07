import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/core/services/general_settings_cache_service.dart';

part 'app_settings_store.g.dart';

@LazySingleton()
class AppSettingsStore = AppSettingsStoreBase with _$AppSettingsStore;

abstract class AppSettingsStoreBase with Store {
  final GeneralSettingsCacheService _configService;
  AppSettingsStoreBase(this._configService);

  @observable
  bool hasSeenOnboarding = false;

  @action
  Future<void> loadInitialConfigs() async {
    hasSeenOnboarding = await _configService.hasSeenOnboarding;
  }

  @action
  Future<void> completeOnboarding() async {
    await _configService.setOnboardingSeen();
    hasSeenOnboarding = true;
  }
}
