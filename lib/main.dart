import 'package:base/entitis/app_settings.dart';
import 'package:base/feature/intro/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:base/utility/un_focus.dart';
import 'bloc/setting/setting_bloc.dart';
import 'config/themes/themes.dart';
import 'services/mobile_settings_service.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var mobileSettingsService = await MobileSettingsService.instance();
  runApp(MyApp(mobileSettingsService: mobileSettingsService));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.mobileSettingsService});
  final MobileSettingsService mobileSettingsService;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SettingsBloc settingsBloc;
  AppSettings? _appSettings;

  @override
  void initState() {
    settingsBloc = SettingsBloc(mobileSettingsService: widget.mobileSettingsService);
    settingsBloc.settings.listen(
      (event) => setState(
        () => _appSettings = event,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => settingsBloc),
      ],
      child: _appSettings == null
          ? const SizedBox()
          : MaterialApp(
              debugShowCheckedModeBanner: false,
              showPerformanceOverlay: false,
              showSemanticsDebugger: false,
              debugShowMaterialGrid: false,
              navigatorKey: navigator,
              locale: _appSettings!.isArabic ? const Locale('ar', 'MA') : const Locale('en', 'US'),
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
              darkTheme: Themes.darkTheme().themeData,
              theme: Themes.lightTheme().themeData,
              themeMode: _appSettings!.lightTheme ? ThemeMode.light : ThemeMode.dark,
              home: const Splash(),
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: (1 * (MediaQuery.of(context).size.height / 844)),
                    alwaysUse24HourFormat: false,
                  ),
                  child: Unfocus(
                    child: child,
                  ),
                );
              },
            ),
    );
  }
}
