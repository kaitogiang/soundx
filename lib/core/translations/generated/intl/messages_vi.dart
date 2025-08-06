// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
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
  String get localeName => 'vi';

  static String m0(terms, policy) => "Tôi đồng ý với ${terms} và ${policy}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "agreeString": MessageLookupByLibrary.simpleMessage("Tôi đồng ý với "),
    "andString": MessageLookupByLibrary.simpleMessage(" và "),
    "appName": MessageLookupByLibrary.simpleMessage("Ứng dụng SoundX"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage(
      "Xác nhận mật khẩu",
    ),
    "createYourAccount": MessageLookupByLibrary.simpleMessage(
      "Tạo tài khoản của bạn",
    ),
    "englishLanguage": MessageLookupByLibrary.simpleMessage("Tiếng Anh"),
    "fieldIsNotEmpty": MessageLookupByLibrary.simpleMessage(
      "Trường này không được rỗng.",
    ),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Quên mật khẩu?"),
    "hello": MessageLookupByLibrary.simpleMessage("Xin chào"),
    "iAgreeTerms": m0,
    "invalidEmail": MessageLookupByLibrary.simpleMessage("Email không hợp lệ."),
    "loginEmailHintText": MessageLookupByLibrary.simpleMessage("Email"),
    "loginPasswordHintText": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
    "loginWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Đăng nhập với Google",
    ),
    "or": MessageLookupByLibrary.simpleMessage("Hoặc"),
    "pageLoginButtonTitle": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
    "pageRegisterButtonTitle": MessageLookupByLibrary.simpleMessage("Đăng ký"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Chính sách bảo mật"),
    "signedUpName": MessageLookupByLibrary.simpleMessage("Họ và tên"),
    "termsOfService": MessageLookupByLibrary.simpleMessage(
      "Điều khoản dịch vụ",
    ),
    "vietnameseLanguage": MessageLookupByLibrary.simpleMessage("Tiếng Việt"),
    "welcome": MessageLookupByLibrary.simpleMessage(
      "Chào mừng bạn đến với ứng dụng của tôi",
    ),
  };
}
