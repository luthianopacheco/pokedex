import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/core/stores/app_error_store.dart';

@LazySingleton()
class RouteRefresh extends ValueNotifier<int> {
  late final ReactionDisposer _disposer;
  final AppErrorStore _appErrorStore = getIt<AppErrorStore>();

  RouteRefresh() : super(0) {
    _disposer = reaction(
      (_) => _appErrorStore.globalErrorMessage,
      (_) => value++,
    );
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }
}
