import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soundx/core/translations/generated/l10n.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'widgetbook.directories.g.dart'; // Generated file

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        LocalizationAddon(
          locales: AppTranslate.delegate.supportedLocales,
          localizationsDelegates: [
            AppTranslate.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialLocale: AppTranslate.delegate.supportedLocales.first,
        ),
      ],
      lightTheme: ThemeData(textTheme: GoogleFonts.ralewayTextTheme()),
      darkTheme: ThemeData(textTheme: GoogleFonts.ralewayTextTheme()),
    );
  }
}
