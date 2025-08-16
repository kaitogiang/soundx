import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
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
