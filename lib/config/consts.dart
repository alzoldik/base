import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Consts {
  static String biseUrl = "${dotenv.env['kBASUrRL']}";
  static List<Locale> supportedLocales = const [
    Locale('ar', 'EG'),
    Locale('en', 'US'),
  ];
}
