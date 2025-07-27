// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppTranslate {
  AppTranslate();

  static AppTranslate? _current;

  static AppTranslate get current {
    assert(
      _current != null,
      'No instance of AppTranslate was loaded. Try to initialize the AppTranslate delegate before accessing AppTranslate.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppTranslate> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppTranslate();
      AppTranslate._current = instance;

      return instance;
    });
  }

  static AppTranslate of(BuildContext context) {
    final instance = AppTranslate.maybeOf(context);
    assert(
      instance != null,
      'No instance of AppTranslate present in the widget tree. Did you add AppTranslate.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static AppTranslate? maybeOf(BuildContext context) {
    return Localizations.of<AppTranslate>(context, AppTranslate);
  }

  /// `SoundX app`
  String get appName {
    return Intl.message('SoundX app', name: 'appName', desc: '', args: []);
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: 'an simple example about using this',
      args: [],
    );
  }

  /// `Welcome to my app`
  String get welcome {
    return Intl.message(
      'Welcome to my app',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get pageLoginButtonTitle {
    return Intl.message(
      'Login',
      name: 'pageLoginButtonTitle',
      desc: 'Login title for the button in login page',
      args: [],
    );
  }

  /// `Sign Up`
  String get pageRegisterButtonTitle {
    return Intl.message(
      'Sign Up',
      name: 'pageRegisterButtonTitle',
      desc: 'Sign up title for the button in register page',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppTranslate> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppTranslate> load(Locale locale) => AppTranslate.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
