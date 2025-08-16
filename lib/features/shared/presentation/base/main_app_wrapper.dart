import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundx/features/shared/data/datasources/native_method.dart';
import 'package:soundx/features/shared/presentation/base/auto_hide_keyboard.dart';

class MainAppWrapper extends ConsumerStatefulWidget {
  final Widget child;

  const MainAppWrapper({super.key, required this.child});

  @override
  ConsumerState<MainAppWrapper> createState() => _MainAppWrapperState();
}

class _MainAppWrapperState extends ConsumerState<MainAppWrapper> {
  DateTime? duration;

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
      child: AutoHideKeyboard(child: widget.child),
    );
  }
}
