class AppSettings implements Copyable<AppSettings> {
  /// The current theme name.
  final bool lightTheme;

  /// The current locale name.
  final bool isArabic;

  AppSettings({
    required this.lightTheme,
    required this.isArabic,
  });

  AppSettings.sensibleDefaults()
      : lightTheme = true,
        isArabic = true;

  @override
  AppSettings copy({bool? lightTheme, bool? isArabic}) {
    return AppSettings(
      lightTheme: lightTheme ?? this.lightTheme,
      isArabic: isArabic ?? this.isArabic,
    );
  }

  @override
  AppSettings copyWith(AppSettings appSettings) => AppSettings(
        lightTheme: appSettings.lightTheme,
        isArabic: appSettings.isArabic,
      );
}

abstract class Copyable<T> {
  T copy();
  T copyWith(T item);
}
