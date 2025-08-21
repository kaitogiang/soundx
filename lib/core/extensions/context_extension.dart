import 'package:flutter/cupertino.dart';
import 'package:soundx/core/translations/generated/l10n.dart';

extension ContextExtension on BuildContext {
  AppTranslate get tr => AppTranslate.of(this);

  double get heightScreen => MediaQuery.of(this).size.height;

  double get widthScreen => MediaQuery.of(this).size.width;
}
