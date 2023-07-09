import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../main.dart';

extension StringEx on String {
  String takeOnly(int value) {
    if (length > value) {
      return "${substring(0, value)} ...";
    }
    return this;
  }

  String forWeb({required bool web}) => web ? replaceFirst('assets/', '') : this;

  String get removeSpaces {
    if (length > 0) {
      return replaceAll(RegExp(r"\n+"), "\n");
    }
    return this;
  }

  bool get isPhone => RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$').hasMatch(this) && (length > 8 || length <= 10);

  bool isNumeric() {
    for (int i = 0; i < length; i++) {
      if (double.tryParse(this[i]) != null) {
        return true;
      }
    }
    return false;
  }

  bool get isEmail => RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      ).hasMatch(this);

  bool get isArabic => RegExp("/[\u0600-\u06FF\u0750-\u077F]/").hasMatch(this);

  bool get isEnglish => RegExp('[a-zA-Z]').hasMatch(this);

  TextDirection get textDirection => RegExp('[a-zA-Z]').hasMatch(this) ? TextDirection.ltr : TextDirection.rtl;
}

extension NumEx on int {
  Duration get hours => Duration(hours: this);
  Duration get minutes => Duration(minutes: this);
  Duration get seconds => Duration(seconds: this);
  Duration get milliseconds => Duration(milliseconds: this);
}

extension WidgetEx on Widget {
  Widget ripple(
    Function? onPressed, {
    BorderRadiusGeometry borderRadius = const BorderRadius.all(Radius.circular(5)),
  }) =>
      InkWell(
        onTap: onPressed?.call(),
        child: this,
      );

  Widget paddingAll(
    double value,
  ) =>
      Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );

  Widget paddingSymmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );

  Widget boarder(
    double value,
  ) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(value),
        child: this,
      );

  Widget get onCenter => Center(child: this);
}

extension ContextEX on BuildContext {
  double get h => MediaQuery.of(this).size.height;

  double get w => MediaQuery.of(this).size.width;
  ColorScheme get color => Theme.of(this).colorScheme;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppLocalizations get L => AppLocalizations.of(this)!;
}

extension ScreenScale on num {
  double get w => MediaQuery.of(navigator.currentContext!).size.width * (toDouble() / 390);
  double get h => MediaQuery.of(navigator.currentContext!).size.height * (toDouble() / 844);
}
