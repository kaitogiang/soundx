import 'package:flutter/services.dart';

class NativeMethod {
  static const platform = MethodChannel('app.channel.shared');

  static Future<void> hideAppToBackground() async {
    try {
      await platform.invokeMethod('moveAppToBackground');
    } catch (e) {
      print(e);
    }
  }
}
