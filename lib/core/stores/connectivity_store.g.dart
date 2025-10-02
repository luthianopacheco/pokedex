// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectivityStore on ConnectivityStoreBase, Store {
  late final _$isConnectedAtom =
      Atom(name: 'ConnectivityStoreBase.isConnected', context: context);

  @override
  bool get isConnected {
    _$isConnectedAtom.reportRead();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.reportWrite(value, super.isConnected, () {
      super.isConnected = value;
    });
  }

  late final _$isCheckingAtom =
      Atom(name: 'ConnectivityStoreBase.isChecking', context: context);

  @override
  bool get isChecking {
    _$isCheckingAtom.reportRead();
    return super.isChecking;
  }

  @override
  set isChecking(bool value) {
    _$isCheckingAtom.reportWrite(value, super.isChecking, () {
      super.isChecking = value;
    });
  }

  late final _$ConnectivityStoreBaseActionController =
      ActionController(name: 'ConnectivityStoreBase', context: context);

  @override
  void setIsConnected(bool value) {
    final _$actionInfo = _$ConnectivityStoreBaseActionController.startAction(
        name: 'ConnectivityStoreBase.setIsConnected');
    try {
      return super.setIsConnected(value);
    } finally {
      _$ConnectivityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckingStatus(bool status) {
    final _$actionInfo = _$ConnectivityStoreBaseActionController.startAction(
        name: 'ConnectivityStoreBase.setCheckingStatus');
    try {
      return super.setCheckingStatus(status);
    } finally {
      _$ConnectivityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isConnected: ${isConnected},
isChecking: ${isChecking}
    ''';
  }
}
