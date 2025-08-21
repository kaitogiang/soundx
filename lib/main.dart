import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:overlay_notification/overlay_notification.dart';
import 'package:soundx/core/config/di.dart';
import 'package:soundx/core/constants/app_color.dart';
import 'package:soundx/core/navgiation/navigation_config.dart';
import 'package:soundx/core/translations/generated/l10n.dart';
import 'package:soundx/features/shared/presentation/providers/language_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: '.env');
  await configureInjection();
  await Firebase.initializeApp();
  await GoogleSignIn.instance.initialize(
    serverClientId: dotenv.env['GOOGLE_CLIENT_ID'],
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  DateTime? duration;

  @override
  Widget build(BuildContext context) {
    final langProvider = ref.watch(languageProvider);
    return OverlayNotification.global(
      toastTheme: ToastThemeData(
        background: AppColors.lightGrey,
        textColor: AppColors.blackColor,
      ),
      child: MaterialApp.router(
        title: 'SoundX',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: GoogleFonts.ralewayTextTheme(),
        ),
        localizationsDelegates: [
          AppTranslate.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppTranslate.delegate.supportedLocales,
        locale: langProvider,
        routerConfig: goRouterConfig,
      ),
    );
  }
}
