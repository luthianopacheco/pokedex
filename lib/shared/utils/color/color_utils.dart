import 'package:flutter/material.dart';

extension ContrastColorExtension on Color {
  Color get contrastColor =>
      computeLuminance() > 0.3 ? Color(0xff000000) : Color(0xffFAFAFA);
}
