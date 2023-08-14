import 'package:shared_preferences/shared_preferences.dart';
import '../entities/app_settings.dart';
import 'setting_services.dart';

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
  int get langIndex => (_sharedPreferences.getInt('langIndex') ?? 0);

  @override
  set langIndex(int value) => _sharedPreferences.setInt('langIndex', value);

  @override
  late AppSettings settings;
}
