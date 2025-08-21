// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(terms, policy) => "I agree to the ${terms} and ${policy}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "agreeString": MessageLookupByLibrary.simpleMessage("I agree to the "),
    "andString": MessageLookupByLibrary.simpleMessage(" and "),
    "appName": MessageLookupByLibrary.simpleMessage("SoundX app"),
    "backToLogin": MessageLookupByLibrary.simpleMessage("Back to Login"),
    "cancelButton": MessageLookupByLibrary.simpleMessage("Cancel"),
    "checkYourEmailTitle": MessageLookupByLibrary.simpleMessage(
      "Check your mail",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "continueButton": MessageLookupByLibrary.simpleMessage("Continue"),
    "createYourAccount": MessageLookupByLibrary.simpleMessage(
      "Create your Account",
    ),
    "englishLanguage": MessageLookupByLibrary.simpleMessage("English"),
    "fieldIsNotEmpty": MessageLookupByLibrary.simpleMessage(
      "This field cannot be empty.",
    ),
    "fillAllRequired": MessageLookupByLibrary.simpleMessage(
      "Please fill in all required fields.",
    ),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot Password?"),
    "hello": MessageLookupByLibrary.simpleMessage("Hello"),
    "iAgreeTerms": m0,
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Invalid email format.",
    ),
    "loginEmailHintText": MessageLookupByLibrary.simpleMessage("Email"),
    "loginPasswordHintText": MessageLookupByLibrary.simpleMessage("Password"),
    "loginWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Login With Google",
    ),
    "or": MessageLookupByLibrary.simpleMessage("Or"),
    "pageLoginButtonTitle": MessageLookupByLibrary.simpleMessage("Login"),
    "pageRegisterButtonTitle": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "passwordAtLeast8": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters long.",
    ),
    "passwordNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "pleaseCheckYourMail": MessageLookupByLibrary.simpleMessage(
      "Please check your email.",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "resetYourPassword": MessageLookupByLibrary.simpleMessage(
      "Reset your password",
    ),
    "signedUpName": MessageLookupByLibrary.simpleMessage("Name"),
    "somethingWrong": MessageLookupByLibrary.simpleMessage(
      "An error occurred. Please try again.",
    ),
    "termsOfService": MessageLookupByLibrary.simpleMessage("Terms of Service"),
    "vietnameseLanguage": MessageLookupByLibrary.simpleMessage("Vietnamese"),
    "weHaveSentEmailWithLink": MessageLookupByLibrary.simpleMessage(
      "We have sent an email that contains a link to reset your password",
    ),
    "welcome": MessageLookupByLibrary.simpleMessage("Welcome to my app"),
  };
}
