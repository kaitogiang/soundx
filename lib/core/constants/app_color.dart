import 'package:flutter/material.dart';

class AppColors {
  static Color get whiteColor => Colors.white;

  static Color get blackColor => Colors.black;

  static Color get greenColor => Color(0xFF02EE8B);

  static Color get darkGreenColor => Color(0xFF01C373);

  static Color get lightGreenColor => Color(0xFFDDEBE5);

  static Color get mediumGreenColor => Color(0xFF0EC679);

  static Color get transparent => Colors.transparent;

  static Color get linkColor => Color(0xFF1E90FF);

  static Color get secondaryColor => Color(0xFFDDEBE5);

  static Color get grey => Colors.grey;

  static Color get lightGrey => Colors.grey.shade200;

  static Color darken(Color color, [double amount = .1]) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }
}
