import 'package:base/feature/intro/view/splash.dart';
import 'package:base/utility/keybord_lisenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:base/utility/un_focus.dart';
import 'config/themes/themes.dart';
import 'services/mobile_settings_service.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var mobileSettingsService = await MobileSettingsService.instance();
  runApp(MyApp(mobileSettingsService: mobileSettingsService));
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        showSemanticsDebugger: false,
        debugShowMaterialGrid: false,
        navigatorKey: navigator,
        locale: const Locale('en', 'US'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', 'MA'),
          Locale('en', 'US'),
        ],
        title: 'HCM7',
        onGenerateTitle: (context) => AppLocalizations.of(context)!.app_title,
        darkTheme: Themes.darkTheme().themeData,
        theme: Themes.lightTheme().themeData,
        themeMode: ThemeMode.light,
        home: const Splash(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: (1 * (MediaQuery.of(context).size.height / 844)),
              alwaysUse24HourFormat: false,
            ),
            child: Unfocus(child: child),
          );
        },
      ),
    );
  }
}
