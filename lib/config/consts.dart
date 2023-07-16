import 'package:flutter_dotenv/flutter_dotenv.dart';

class Consts {
  static String biseUrl = "${dotenv.env['kBASUrRL']}";
}
