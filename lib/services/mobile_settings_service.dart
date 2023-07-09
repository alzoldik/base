import 'package:shared_preferences/shared_preferences.dart';
import '../entitis/app_settings.dart';
import 'setting_services.dart';

/// An implementation [SettingService] for mobile devices backed by
/// shared preferences.
class MobileSettingsService extends SettingsService {
  static late SharedPreferences _sharedPreferences;

  static MobileSettingsService? _instance;

  MobileSettingsService._create();

  static Future<MobileSettingsService> instance() async {
    if (_instance == null) {
      _instance = MobileSettingsService._create();
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  @override
  bool get themeLightMode => (_sharedPreferences.getBool('theme') ?? true);

  @override
  set themeLightMode(bool value) => _sharedPreferences.setBool('theme', value);

  @override
  bool get isArabic => (_sharedPreferences.getBool('isArabic') ?? false);

  @override
  set isArabic(bool value) => _sharedPreferences.setBool('isArabic', value);

  @override
  late AppSettings settings;
}
