import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'connectivity_store.g.dart';

@LazySingleton()
class ConnectivityStore = ConnectivityStoreBase with _$ConnectivityStore;

abstract class ConnectivityStoreBase with Store {
  final Connectivity _connectivity;
  final List<ConnectivityResult> _validConnections = const [
    ConnectivityResult.ethernet,
    ConnectivityResult.mobile,
    ConnectivityResult.vpn,
    ConnectivityResult.wifi,
  ];

  @observable
  bool isConnected = true;

  @observable
  bool isChecking = false;

  ConnectivityStoreBase(this._connectivity) {
    _monitorConnectivity();
  }

  @action
  void setIsConnected(bool value) {
    isConnected = value;
  }

  @action
  void setCheckingStatus(bool status) {
    isChecking = status;
  }

  void _monitorConnectivity() async {
    final initialStatus = await _connectivity.checkConnectivity();
    setIsConnected(_validConnections.any(initialStatus.contains));

    _connectivity.onConnectivityChanged.listen((statusList) {
      setIsConnected(_validConnections.any(statusList.contains));
    });
  }
}
