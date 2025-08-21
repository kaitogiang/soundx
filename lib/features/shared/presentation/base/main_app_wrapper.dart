import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:soundx/core/config/app_event_bus.dart';
import 'package:soundx/core/constants/app_color.dart';
import 'package:soundx/core/events/unfocus_keyboard_event.dart';
import 'package:soundx/core/extensions/color_extension.dart';
import 'package:soundx/features/shared/data/datasources/native_method.dart';
import 'package:soundx/features/shared/presentation/base/auto_hide_keyboard.dart';
import 'package:soundx/features/shared/presentation/providers/shared_provider.dart';

class MainAppWrapper extends ConsumerStatefulWidget {
  final Widget child;

  const MainAppWrapper({super.key, required this.child});

  @override
  ConsumerState<MainAppWrapper> createState() => _MainAppWrapperState();
}

class _MainAppWrapperState extends ConsumerState<MainAppWrapper> {
  DateTime? duration;
  StreamSubscription? _keyboardSubscription;

  @override
  void initState() {
    super.initState();
    ref.listenManual(overlayLoadingProvider, (previous, next) {
      if (previous != next) {
        switch (next) {
          case true:
            return context.loaderOverlay.show();
          case false:
            return context.loaderOverlay.hide();
        }
      }
    });
    _keyboardSubscription = AppEventBus().stream<UnfocusKeyboardEvent>().listen(
      (event) {
        if (!mounted) return;
        print("Keyobard");
        FocusScope.of(context).unfocus();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        final now = DateTime.now();
        if (duration != null &&
            now.difference(duration!).abs().inMilliseconds <= 500) {
          // SystemNavigator.pop();
          await NativeMethod.hideAppToBackground();
          duration = null;
          return;
        }
        duration = now;
        print('Wait to the next tap');
      },
      child: LoaderOverlay(
        overlayWidgetBuilder: (progress) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.greenColor.toDarker(0.1),
            ),
          );
        },
        child: AutoHideKeyboard(child: widget.child),
      ),
    );
  }
}
