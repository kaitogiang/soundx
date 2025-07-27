import 'package:flutter/cupertino.dart';
import 'package:soundx/core/translations/generated/l10n.dart';

extension ContextExtension on BuildContext {
  AppTranslate get tr => AppTranslate.of(this);
}
