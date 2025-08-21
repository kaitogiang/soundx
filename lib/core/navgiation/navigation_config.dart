import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soundx/core/config/app_event_bus.dart';
import 'package:soundx/core/events/unfocus_keyboard_event.dart';
import 'package:soundx/features/auth/presentation/pages/check_email_screen.dart';
import 'package:soundx/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:soundx/features/auth/presentation/pages/login_page.dart';
import 'package:soundx/features/auth/presentation/pages/sign_up_page.dart';
import 'package:soundx/features/music_library/presentation/music_library_page.dart';
import 'package:soundx/features/shared/presentation/base/main_app_wrapper.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final mainNavigatorKey = GlobalKey<NavigatorState>();
final goRouterConfig = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    ShellRoute(
      navigatorKey: mainNavigatorKey,
      builder: (context, state, child) {
        return MainAppWrapper(child: child);
      },
      observers: [CustomObserver()],
      routes: [
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) {
            return LoginPage();
          },
        ),
        GoRoute(
          path: '/sign-up',
          name: 'signUp',
          builder: (context, state) {
            return SignUpPage();
          },
        ),
        GoRoute(
          path: '/forgot-password',
          name: 'forgotPassword',
          builder: (context, state) {
            return ForgotPasswordPage();
          },
        ),
        GoRoute(
          path: '/check-email',
          name: 'checkEmail',
          builder: (context, state) {
            return CheckYourEmailPage();
          },
        ),
        GoRoute(
          path: '/',
          name: 'musicLibrary',
          builder: (context, state) {
            return MusicLibraryPage();
          },
        ),
      ],
    ),
  ],
);

class CustomObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    AppEventBus().fire(UnfocusKeyboardEvent());
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print('Push new route');
    AppEventBus().fire(UnfocusKeyboardEvent());
    super.didPush(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print('Push new route');

    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print('Push new route');
    AppEventBus().fire(UnfocusKeyboardEvent());
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
