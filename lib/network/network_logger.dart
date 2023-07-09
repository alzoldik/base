import 'dart:convert';
import 'package:dio/dio.dart';
import '../utility/utility.dart';

class NetworkLogger {
  static final logger = InterceptorsWrapper(
    onRequest: (RequestOptions options, handler) {
      String headers = "";
      String body = "";
      String queryParameters = "";
      options.headers.forEach((key, value) => headers += "$key: $value |");

      if (options.data.runtimeType == FormData) {
        for (var i = 0; i < (options.data as FormData).fields.length; i++) {
          (options.data as FormData).fields[i];
          body += '${(options.data as FormData).fields[i].key}: ${(options.data as FormData).fields[i].value} | ';
        }
      } else if (options.data.runtimeType is Map) {
        (options.data as Map).forEach((key, value) => body += "$key: $value |");
      } else {
        body = "${options.data}";
      }
      options.queryParameters.forEach((key, value) => queryParameters += "$key: $value |");
      cprint(
        "┌------------------------------------------------------------------------------",
      );
      cprint('''| Request: ${options.method} ${options.uri}''');
      cprint(
        "├------------------------------------------------------------------------------",
      );
      cprint('''| Headers: $headers''');
      cprint(
        "├------------------------------------------------------------------------------",
      );
      cprint('''| Body: $body''');
      cprint(
        "├------------------------------------------------------------------------------",
      );
      cprint('''| QueryParameters: $queryParameters''');
      cprint(
        "├------------------------------------------------------------------------------",
      );
      handler.next(options);
    },
    onResponse: (Response response, handler) async {
      JsonEncoder encoder = const JsonEncoder.withIndent('        ');
      String prettyprint = encoder.convert(response.data);
      cprint("| Status code: ${response.statusCode}");
      cprint(
        "├------------------------------------------------------------------------------",
      );
      cprint("| Response: $prettyprint");
      cprint(
        "└------------------------------------------------------------------------------",
      );
      cprint(
        "================================================================================",
      );
      handler.next(response);
    },
    onError: (DioException error, handler) async {
      handler.next(error); //continue
    },
  );
}
