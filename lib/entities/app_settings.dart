class AppSettings implements Copyable<AppSettings> {
  /// The current theme name.
  final bool lightTheme;

  /// The current locale name.
  final int langIndex;

  AppSettings({
    required this.lightTheme,
    required this.langIndex,
  });

  AppSettings.sensibleDefaults()
      : lightTheme = true,
        langIndex = 0;

  @override
  AppSettings copy({bool? lightTheme, int? langIndex}) {
    return AppSettings(
      lightTheme: lightTheme ?? this.lightTheme,
      langIndex: langIndex ?? this.langIndex,
    );
  }

  @override
  AppSettings copyWith(AppSettings appSettings) => AppSettings(
        lightTheme: appSettings.lightTheme,
        langIndex: appSettings.langIndex,
      );
}

abstract class Copyable<T> {
  T copy();
  T copyWith(T item);
}
