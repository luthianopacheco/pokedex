import 'dart:ui';

class SettingItem {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool isToggled;

  SettingItem({
    required this.title,
    required this.subtitle,
    this.onTap,
    this.isToggled = false,
  });
}
