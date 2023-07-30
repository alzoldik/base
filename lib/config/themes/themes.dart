import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors/dark_colors.dart';
import '../colors/light_colors.dart';

final ThemeData _lightTheme = _buildLightTheme();
final ThemeData _darkTheme = _buildDarktheme();

ThemeData _buildLightTheme() {
  final base = ThemeData.light();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
    ),
  );
  return base.copyWith(
    colorScheme: const ColorScheme.light(
      secondary: LightColor.secondary,
      primary: LightColor.primary,
      error: LightColor.brightRed,
      background: LightColor.offWhite,
    ),
    brightness: Brightness.light,
    primaryColor: LightColor.primary,
    primaryColorLight: LightColor.primary.withOpacity(0.5),
    primaryColorDark: LightColor.primary.withOpacity(1),
    secondaryHeaderColor: LightColor.secondary,
    canvasColor: LightColor.offWhite,
    scaffoldBackgroundColor: LightColor.offWhite,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: LightColor.offWhite,
    ),
    cardColor: LightColor.offWhite,
    dividerColor: LightColor.grey,
    highlightColor: LightColor.grey,
    splashColor: LightColor.offWhite,
    unselectedWidgetColor: LightColor.offWhite,
    disabledColor: LightColor.primary.withOpacity(0.3),
    toggleButtonsTheme: const ToggleButtonsThemeData(
      color: LightColor.secondary,
    ),
    dialogBackgroundColor: LightColor.offWhite,
    indicatorColor: LightColor.primary,
    hintColor: LightColor.primary,
    primaryTextTheme: Typography.material2018(
      platform: TargetPlatform.iOS,
    ).black,
    textTheme: Typography.material2018(
      platform: TargetPlatform.iOS,
    ).black,
    primaryIconTheme: const IconThemeData(
      color: LightColor.grey,
    ),
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: LightColor.secondary,
    ),
    iconTheme: base.iconTheme.copyWith(
      color: LightColor.primary,
    ),
    sliderTheme: const SliderThemeData().copyWith(
      valueIndicatorColor: LightColor.secondary,
      showValueIndicator: ShowValueIndicator.always,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: base.appBarTheme.copyWith(
      centerTitle: true,
      elevation: 0,
      backgroundColor: LightColor.offWhite,
      foregroundColor: LightColor.primary,
      titleTextStyle: const TextStyle(
        fontSize: 16,
        color: LightColor.primary,
        fontWeight: FontWeight.w600,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: Colors.white,
        statusBarColor: LightColor.offWhite,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: const TextStyle(
        fontSize: 12,
        color: LightColor.grey,
      ),
      labelStyle: const TextStyle(
        fontSize: 14,
        color: LightColor.primary,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      floatingLabelStyle: const TextStyle(
        fontSize: 14,
        color: LightColor.primary,
      ),
      alignLabelWithHint: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: LightColor.grey.withOpacity(0.1),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    dataTableTheme: DataTableThemeData(
      dataRowColor: MaterialStateProperty.all(
        LightColor.brightRed,
      ),
      headingRowColor: MaterialStateProperty.all(
        LightColor.offWhite,
      ),
      headingTextStyle: const TextStyle(
        color: LightColor.brightRed,
      ),
    ),
    snackBarTheme: base.snackBarTheme.copyWith(
      actionTextColor: LightColor.secondary,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(foregroundColor: LightColor.grey),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(
        LightColor.primary,
      ),
    ),
  );
}

ThemeData _buildDarktheme() {
  final base = ThemeData.dark();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
    ),
  );
  return base.copyWith(
    colorScheme: const ColorScheme.light(
      secondary: DarkColor.secondary,
      primary: DarkColor.primary,
      error: DarkColor.brightRed,
      background: DarkColor.offWhite,
    ),
    brightness: Brightness.light,
    primaryColor: DarkColor.primary,
    primaryColorLight: DarkColor.primary.withOpacity(0.5),
    primaryColorDark: DarkColor.primary.withOpacity(1),
    secondaryHeaderColor: DarkColor.secondary,
    canvasColor: DarkColor.offWhite,
    scaffoldBackgroundColor: DarkColor.black,
    bottomAppBarTheme: const BottomAppBarTheme(color: DarkColor.offWhite),
    cardColor: DarkColor.offWhite,
    dividerColor: DarkColor.grey,
    highlightColor: DarkColor.grey,
    splashColor: DarkColor.offWhite,
    unselectedWidgetColor: DarkColor.offWhite,
    disabledColor: DarkColor.primary.withOpacity(0.3),
    toggleButtonsTheme: const ToggleButtonsThemeData(
      color: DarkColor.secondary,
    ),
    dialogBackgroundColor: DarkColor.offWhite,
    indicatorColor: DarkColor.primary,
    hintColor: DarkColor.primary,
    primaryTextTheme: Typography.material2018(
      platform: TargetPlatform.iOS,
    ).white,
    textTheme: Typography.material2018(
      platform: TargetPlatform.iOS,
    ).white,
    primaryIconTheme: const IconThemeData(
      color: DarkColor.grey,
    ),
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: Colors.orange,
    ),
    iconTheme: base.iconTheme.copyWith(
      color: DarkColor.primary,
    ),
    sliderTheme: const SliderThemeData().copyWith(
      valueIndicatorColor: DarkColor.secondary,
      showValueIndicator: ShowValueIndicator.always,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: DarkColor.black,
      foregroundColor: Colors.white,
      shadowColor: const Color(0xff222222),
      centerTitle: true,
      elevation: 1.0,
      toolbarHeight: 38,
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: DarkColor.offWhite,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: const TextStyle(
        fontSize: 12,
        color: DarkColor.grey,
      ),
      labelStyle: const TextStyle(
        fontSize: 14,
        color: DarkColor.primary,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      floatingLabelStyle: const TextStyle(
        fontSize: 14,
        color: DarkColor.primary,
      ),
      alignLabelWithHint: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: DarkColor.grey.withOpacity(0.1),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    snackBarTheme:
        base.snackBarTheme.copyWith(actionTextColor: DarkColor.secondary),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(foregroundColor: DarkColor.grey),
    ),
  );
}

class Themes {
  final ThemeData themeData;
  Themes({required this.themeData});
  factory Themes.lightTheme() => Themes(themeData: _lightTheme);

  factory Themes.darkTheme() => Themes(themeData: _darkTheme);
}
