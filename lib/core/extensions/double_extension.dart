import 'package:flutter/material.dart';

extension DoubleExtension on double {
  Widget get horizontalGap => SizedBox(width: this);

  Widget get verticalGap => SizedBox(height: this);

  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: this);

  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: this);

  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: this);

  EdgeInsets get allPadding => EdgeInsets.all(this);
}
