import 'package:base/app/app_state.dart';
import 'package:base/entities/app_settings.dart';
import 'package:base/feature/intro/view/light_splash.dart';
import 'package:base/services/notification_services.dart';
import 'package:base/utility/keybord_lisenter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:base/utility/un_focus.dart';
import 'bloc/setting/setting_bloc.dart';
import 'config/themes/themes.dart';
import 'feature/intro/view/dark_splash.dart';
import 'services/mobile_settings_service.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationServices().init();
  FirebaseMessaging.onBackgroundMessage(handelBackgroundMessage);
  await dotenv.load();
  var mobileSettingsService = await MobileSettingsService.instance();
  runApp(
    MyApp(
      mobileSettingsService: mobileSettingsService,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.mobileSettingsService});
  final MobileSettingsService mobileSettingsService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<KeyBordBloc>(create: (_) => KeyBordBloc()),
      ],
      child: BlocProvider.value(
        value: SettingsBloc(mobileSettingsService),
        child: BlocBuilder<SettingsBloc, AppState>(
          builder: (context, state) {
            return StreamBuilder<AppSettings>(
              stream: context.read<SettingsBloc>().settings,
              builder: (context, snapshot) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  showPerformanceOverlay: false,
                  showSemanticsDebugger: false,
                  debugShowMaterialGrid: false,
                  navigatorKey: navigator,
                  locale: snapshot.data?.isArabic == true
                      ? const Locale('ar', 'EG')
                      : const Locale('en', 'US'),
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('ar', 'EG'),
                    Locale('en', 'US'),
                  ],
                  title: 'HCM7',
                  onGenerateTitle: (context) =>
                      AppLocalizations.of(context)!.app_title,
                  darkTheme: Themes.darkTheme().themeData,
                  theme: Themes.lightTheme().themeData,
                  themeMode: snapshot.data?.lightTheme == true
                      ? ThemeMode.light
                      : ThemeMode.dark,
                  home: snapshot.data?.lightTheme == true
                      ? const LightSplash()
                      : const DarkSplash(),
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        textScaleFactor:
                            (1 * (MediaQuery.of(context).size.height / 844)),
                        alwaysUse24HourFormat: false,
                      ),
                      child: Unfocus(child: child),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
