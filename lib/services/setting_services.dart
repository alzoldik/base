import '../entities/app_settings.dart';

abstract class SettingsService {
  AppSettings get settings;

  set settings(AppSettings settings);

  bool get themeLightMode;

  set themeLightMode(bool value);

  bool get isArabic;

  set isArabic(bool value);
}
