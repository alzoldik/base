import 'dart:convert';
import 'dart:developer';
import 'package:base/utility/route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer' as developer;
import 'package:timezone/standalone.dart' as tz;

final kAnalytics = FirebaseAnalytics.instance;

void cprint(
  dynamic data, {
  String? errorIn,
  String? event,
  String label = 'Log',
}) {
  if (kDebugMode) {
    if (errorIn != null) {
      print(
          '****************************** error ******************************');
      developer.log('[Error]',
          time: DateTime.now(), error: data, name: errorIn);
      print(
          '****************************** error ******************************');
    } else if (data != null) {
      developer.log(data, time: DateTime.now(), name: label);
    }
    if (event != null) {
      Utility.logEvent(event, parameter: {});
    }
  }
}

class Utility {
  static launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      cprint('Could not launch $url');
    }
  }

  static void logEvent(String event, {Map<String, dynamic>? parameter}) {
    kReleaseMode
        ? kAnalytics.logEvent(
            name: event,
            parameters: parameter,
          )
        : cprint("[EVENT]: $event");
  }

  static void debugLog(String log, {dynamic param = ""}) {
    final String time = DateFormat("mm:ss:mmm").format(DateTime.now());
    cprint("[$time][Log]: $log, $param");
  }

  static Locale getLocale() {
    return Localizations.localeOf(navigator.currentContext!);
  }

  static String currentTimeZone = "";
  getTimeZone() async {
    currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    now();
  }

  static DateTime now() {
    var detroit = tz.getLocation(currentTimeZone);
    DateTime now = tz.TZDateTime.now(detroit);
    log("$currentTimeZone $now");
    return now;
  }

  static String utf8convert(String text) {
    try {
      return utf8.fuse(base64).decode(Uri.decodeFull(text));
    } catch (e) {
      return text;
    }
  }
}
