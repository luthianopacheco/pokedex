// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_error_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppErrorStore on AppErrorStoreBase, Store {
  late final _$isRetryingAtom = Atom(
    name: 'AppErrorStoreBase.isRetrying',
    context: context,
  );

  @override
  bool get isRetrying {
    _$isRetryingAtom.reportRead();
    return super.isRetrying;
  }

  @override
  set isRetrying(bool value) {
    _$isRetryingAtom.reportWrite(value, super.isRetrying, () {
      super.isRetrying = value;
    });
  }

  late final _$globalErrorTitleAtom = Atom(
    name: 'AppErrorStoreBase.globalErrorTitle',
    context: context,
  );

  @override
  String? get globalErrorTitle {
    _$globalErrorTitleAtom.reportRead();
    return super.globalErrorTitle;
  }

  @override
  set globalErrorTitle(String? value) {
    _$globalErrorTitleAtom.reportWrite(value, super.globalErrorTitle, () {
      super.globalErrorTitle = value;
    });
  }

  late final _$globalErrorMessageAtom = Atom(
    name: 'AppErrorStoreBase.globalErrorMessage',
    context: context,
  );

  @override
  String? get globalErrorMessage {
    _$globalErrorMessageAtom.reportRead();
    return super.globalErrorMessage;
  }

  @override
  set globalErrorMessage(String? value) {
    _$globalErrorMessageAtom.reportWrite(value, super.globalErrorMessage, () {
      super.globalErrorMessage = value;
    });
  }

  late final _$globalErrorRetryCallbackAtom = Atom(
    name: 'AppErrorStoreBase.globalErrorRetryCallback',
    context: context,
  );

  @override
  Future<void> Function()? get globalErrorRetryCallback {
    _$globalErrorRetryCallbackAtom.reportRead();
    return super.globalErrorRetryCallback;
  }

  @override
  set globalErrorRetryCallback(Future<void> Function()? value) {
    _$globalErrorRetryCallbackAtom.reportWrite(
      value,
      super.globalErrorRetryCallback,
      () {
        super.globalErrorRetryCallback = value;
      },
    );
  }

  late final _$setGlobalErrorAsyncAction = AsyncAction(
    'AppErrorStoreBase.setGlobalError',
    context: context,
  );

  @override
  Future<void> setGlobalError(
    String title,
    String message, {
    Future<void> Function()? onRetry,
  }) {
    return _$setGlobalErrorAsyncAction.run(
      () => super.setGlobalError(title, message, onRetry: onRetry),
    );
  }

  late final _$AppErrorStoreBaseActionController = ActionController(
    name: 'AppErrorStoreBase',
    context: context,
  );

  @override
  void setRetryingStatus(bool status) {
    final _$actionInfo = _$AppErrorStoreBaseActionController.startAction(
      name: 'AppErrorStoreBase.setRetryingStatus',
    );
    try {
      return super.setRetryingStatus(status);
    } finally {
      _$AppErrorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearGlobalError() {
    final _$actionInfo = _$AppErrorStoreBaseActionController.startAction(
      name: 'AppErrorStoreBase.clearGlobalError',
    );
    try {
      return super.clearGlobalError();
    } finally {
      _$AppErrorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isRetrying: ${isRetrying},
globalErrorTitle: ${globalErrorTitle},
globalErrorMessage: ${globalErrorMessage},
globalErrorRetryCallback: ${globalErrorRetryCallback}
    ''';
  }
}
