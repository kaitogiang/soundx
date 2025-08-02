import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundx/core/translations/generated/l10n.dart';

final languageProvider = StateProvider<Locale>(
  (_) => AppTranslate.delegate.supportedLocales.first,
);
