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

  /// `Email`
  String get loginEmailHintText {
    return Intl.message(
      'Email',
      name: 'loginEmailHintText',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginPasswordHintText {
    return Intl.message(
      'Password',
      name: 'loginPasswordHintText',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login With Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login With Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `English`
  String get englishLanguage {
    return Intl.message('English', name: 'englishLanguage', desc: '', args: []);
  }

  /// `Vietnamese`
  String get vietnameseLanguage {
    return Intl.message(
      'Vietnamese',
      name: 'vietnameseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Create your Account`
  String get createYourAccount {
    return Intl.message(
      'Create your Account',
      name: 'createYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get signedUpName {
    return Intl.message('Name', name: 'signedUpName', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the {terms} and {policy}`
  String iAgreeTerms(String terms, String policy) {
    return Intl.message(
      'I agree to the $terms and $policy',
      name: 'iAgreeTerms',
      desc: 'Terms and policy for the app',
      args: [terms, policy],
    );
  }

  /// `I agree to the `
  String get agreeString {
    return Intl.message(
      'I agree to the ',
      name: 'agreeString',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get andString {
    return Intl.message(' and ', name: 'andString', desc: '', args: []);
  }

  /// `Invalid email format.`
  String get invalidEmail {
    return Intl.message(
      'Invalid email format.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `This field cannot be empty.`
  String get fieldIsNotEmpty {
    return Intl.message(
      'This field cannot be empty.',
      name: 'fieldIsNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long.`
  String get passwordAtLeast8 {
    return Intl.message(
      'Password must be at least 8 characters long.',
      name: 'passwordAtLeast8',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. Please try again.`
  String get somethingWrong {
    return Intl.message(
      'An error occurred. Please try again.',
      name: 'somethingWrong',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all required fields.`
  String get fillAllRequired {
    return Intl.message(
      'Please fill in all required fields.',
      name: 'fillAllRequired',
      desc: '',
      args: [],
    );
  }

  /// `Reset your password`
  String get resetYourPassword {
    return Intl.message(
      'Reset your password',
      name: 'resetYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelButton {
    return Intl.message('Cancel', name: 'cancelButton', desc: '', args: []);
  }

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `Back to Login`
  String get backToLogin {
    return Intl.message(
      'Back to Login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Check your mail`
  String get checkYourEmailTitle {
    return Intl.message(
      'Check your mail',
      name: 'checkYourEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email.`
  String get pleaseCheckYourMail {
    return Intl.message(
      'Please check your email.',
      name: 'pleaseCheckYourMail',
      desc: '',
      args: [],
    );
  }

  /// `We have sent an email that contains a link to reset your password`
  String get weHaveSentEmailWithLink {
    return Intl.message(
      'We have sent an email that contains a link to reset your password',
      name: 'weHaveSentEmailWithLink',
      desc: '',
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
