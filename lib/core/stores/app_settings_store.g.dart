// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppSettingsStore on AppSettingsStoreBase, Store {
  late final _$hasSeenOnboardingAtom =
      Atom(name: 'AppSettingsStoreBase.hasSeenOnboarding', context: context);

  @override
  bool get hasSeenOnboarding {
    _$hasSeenOnboardingAtom.reportRead();
    return super.hasSeenOnboarding;
  }

  @override
  set hasSeenOnboarding(bool value) {
    _$hasSeenOnboardingAtom.reportWrite(value, super.hasSeenOnboarding, () {
      super.hasSeenOnboarding = value;
    });
  }

  late final _$loadInitialConfigsAsyncAction =
      AsyncAction('AppSettingsStoreBase.loadInitialConfigs', context: context);

  @override
  Future<void> loadInitialConfigs() {
    return _$loadInitialConfigsAsyncAction
        .run(() => super.loadInitialConfigs());
  }

  late final _$completeOnboardingAsyncAction =
      AsyncAction('AppSettingsStoreBase.completeOnboarding', context: context);

  @override
  Future<void> completeOnboarding() {
    return _$completeOnboardingAsyncAction
        .run(() => super.completeOnboarding());
  }

  @override
  String toString() {
    return '''
hasSeenOnboarding: ${hasSeenOnboarding}
    ''';
  }
}
