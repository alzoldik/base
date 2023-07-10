import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../app/app_event.dart';
import '../../app/app_state.dart';
import '../../entities/app_settings.dart';
import '../../services/setting_services.dart';

class SettingsBloc extends Bloc<AppEvent, AppState> {
  final SettingsService _settingsService;

  final BehaviorSubject<AppSettings> _settings =
      BehaviorSubject<AppSettings>.seeded(AppSettings.sensibleDefaults());
  final BehaviorSubject<bool> _darkMode = BehaviorSubject<bool>();
  final BehaviorSubject<bool> _isArabic = BehaviorSubject<bool>();

  SettingsBloc(super.initialState, this._settingsService) {
    _init();
  }

  void _init() {
    var themeLightMode = _settingsService.themeLightMode;
    var isArabic = _settingsService.isArabic;
    var s = AppSettings(lightTheme: themeLightMode, isArabic: isArabic);
    _settings.add(s);
    _darkMode.listen((bool darkMode) {
      themeLightMode = darkMode;
      _settings.add(s.copy(lightTheme: themeLightMode, isArabic: isArabic));
      _settingsService.themeLightMode = darkMode;
    });
    _isArabic.listen((bool lang) {
      isArabic = lang;
      _settings.add(s.copy(isArabic: lang, lightTheme: themeLightMode));
      _settingsService.isArabic = lang;
    });
  }

  Stream<AppSettings> get settings => _settings.stream;

  void Function(bool) get darkMode => _darkMode.add;
  void Function(bool) get isArabic => _isArabic.add;

  AppSettings get currentSettings => _settings.value;

  @override
  Future<void> close() {
    _darkMode.close();
    _isArabic.close();
    _settings.close();
    return super.close();
  }
}
