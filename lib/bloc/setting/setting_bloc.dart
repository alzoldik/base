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
  final BehaviorSubject<int> _langIndex = BehaviorSubject<int>();

  void Function(bool) get darkMode => _darkMode.add;

  void Function(int) get langIndex => _langIndex.add;

  void Function(AppSettings) get updateSetting => _settings.add;

  Stream<AppSettings> get settings => _settings.stream;

  AppSettings get currentSettings => _settings.value;

  SettingsBloc(this._settingsService) : super(Start()) {
    _init();
  }

  void _init() {
    updateSetting(
      AppSettings(
        lightTheme: _settingsService.themeLightMode,
        langIndex: _settingsService.langIndex,
      ),
    );
    _darkMode.listen(
      (bool lightModel) {
        _settingsService.themeLightMode = lightModel;
        updateSetting(currentSettings.copy(lightTheme: lightModel));
      },
    );
    _langIndex.listen(
      (int langIndex) {
        _settingsService.langIndex = langIndex;
        updateSetting(currentSettings.copy(langIndex: langIndex));
      },
    );
  }

  @override
  Future<void> close() {
    _darkMode.close();
    _langIndex.close();
    _settings.close();
    return super.close();
  }
}
