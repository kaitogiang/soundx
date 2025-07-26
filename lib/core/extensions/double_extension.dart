import 'package:flutter/material.dart';

extension DoubleExtension on double {
  Widget get horizontalGap => SizedBox(width: this);

  Widget get verticalGap => SizedBox(height: this);
}
