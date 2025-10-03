import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_colors.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/shared/utils/helper/screen_helper.dart';

class MobileMaskForDesktop extends StatelessWidget {
  final Widget child;
  const MobileMaskForDesktop({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (ScreenHelper.isMobileDevice) return child;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundSplashScreen,
        image: DecorationImage(
          image: AssetImage(Assets.images.background.webDesktop.path),
          opacity: 0.08,
          fit: BoxFit.cover,
        ),
      ),
      child: DeviceFrame(device: Devices.android.googlePixel9, screen: child),
    );
  }
}
