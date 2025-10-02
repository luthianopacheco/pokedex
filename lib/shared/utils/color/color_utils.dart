import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_colors.dart';

extension ContrastColorExtension on Color {
  Color get contrastColor =>
      computeLuminance() > 0.3 ? AppColors.textDark : AppColors.textLight;
}
