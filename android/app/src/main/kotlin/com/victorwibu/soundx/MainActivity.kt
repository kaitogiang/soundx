package com.victorwibu.soundx

import android.content.res.Configuration
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEl = "app.channel.shared";

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEl).setMethodCallHandler {
            call, result ->
            when(call.method) {
                "moveAppToBackground" -> {
                    moveTaskToBack(true);
                    result.success(null);
                }
                else -> result.notImplemented();
            }
        };
    }
}
