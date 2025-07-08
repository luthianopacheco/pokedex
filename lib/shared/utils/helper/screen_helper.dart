import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ScreenHelper {
  final BuildContext context;
  final double mobileMaxWidth;
  final double tabletMaxWidth;

  ScreenHelper(
    this.context, {
    this.mobileMaxWidth = 600,
    this.tabletMaxWidth = 1024,
  });

  /// Verifica se está rodando em um mobile (Android/iOS)
  static bool get isMobileDevice =>
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;

  /// Verifica se é Web Mobile (ou seja, na Web mas com tela pequena)
  bool get isWebMobile =>
      kIsWeb && MediaQuery.of(context).size.width <= mobileMaxWidth;

  /// Verifica se é um dispositivo móvel (nativo ou Web) com tela pequena
  bool get isMobile => MediaQuery.of(context).size.width <= mobileMaxWidth;

  /// Verifica se é tablet
  bool get isTablet {
    final width = MediaQuery.of(context).size.width;
    return width > mobileMaxWidth && width <= tabletMaxWidth;
  }

  /// Verifica se é desktop
  static bool get isDesktop =>
      defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.linux;

  /// Verifica se é web desktop
  bool get isWebDesktop => kIsWeb && MediaQuery.of(context).size.width > tabletMaxWidth;

  /// Verifica se é sistema iOS
  static bool isIOS() => defaultTargetPlatform == TargetPlatform.iOS;
}
