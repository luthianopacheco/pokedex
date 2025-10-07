import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GeneralSettingsCacheService {
  static const String _boxName = 'general_settings_box';
  static const _onboardingKey = 'has_seen_onboarding';
  Box? _box;

  Future<Box> _openBox() async {
    if (_box != null && _box!.isOpen) return _box!;
    _box = await Hive.openBox(_boxName);
    return _box!;
  }

  Future<bool> get hasSeenOnboarding async {
    final box = await _openBox();
    return box.get(_onboardingKey) as bool? ?? false;
  }

  Future<void> setOnboardingSeen() async {
    final box = await _openBox();
    await box.put(_onboardingKey, true);
  }
}
