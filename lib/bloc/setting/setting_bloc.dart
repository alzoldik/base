import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../app/app_event.dart';
import '../../app/app_state.dart';
import '../../entitis/app_settings.dart';
import '../../services/mobile_settings_service.dart';

class SettingsBloc extends Bloc<AppEvent, AppState> {
  SettingsBloc({required this.mobileSettingsService}) : super(Start()) {
    _init();
  }

  final MobileSettingsService mobileSettingsService;

  final BehaviorSubject<AppSettings> _settings = BehaviorSubject<AppSettings>.seeded(
    AppSettings.sensibleDefaults(),
  );

  void _init() {
    AppSettings s = AppSettings(
      lightTheme: mobileSettingsService.themeLightMode,
      isArabic: mobileSettingsService.isArabic,
    );
    _settings.add(s);
  }

  Stream<AppSettings> get settings => _settings.stream;

  AppSettings get currentSettings => _settings.value;

  Function(AppSettings) get updateSetting => _settings.sink.add;

  @override
  Future<void> close() {
    _settings.close();
    return super.close();
  }
}
