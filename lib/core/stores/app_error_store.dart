import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'app_error_store.g.dart';

@LazySingleton()
class AppErrorStore = AppErrorStoreBase with _$AppErrorStore;

abstract class AppErrorStoreBase with Store {
  @observable
  bool isRetrying = false;

  @observable
  String? globalErrorTitle;

  @observable
  String? globalErrorMessage;

  @observable
  Future<void> Function()? globalErrorRetryCallback;

  @action
  void setRetryingStatus(bool status) {
    isRetrying = status;
  }

  @action
  Future<void> setGlobalError(
    String title,
    String message, {
    Future<void> Function()? onRetry,
  }) async {
    globalErrorTitle = title.split('Exception: ').last;
    globalErrorMessage = message.split('Exception: ').last;
    globalErrorRetryCallback = onRetry;
  }

  @action
  void clearGlobalError() {
    globalErrorTitle = null;
    globalErrorMessage = null;
    globalErrorRetryCallback = null;
  }
}
