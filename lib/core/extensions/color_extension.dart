import 'dart:ui';

import 'package:soundx/core/constants/app_color.dart';

extension ColorExtension on Color {
  Color toDarker([double amount = .1]) {
    return AppColors.darken(this, amount);
  }
}
