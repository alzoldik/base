// ignore_for_file: constant_identifier_names

import 'dart:io';
import 'package:dio/dio.dart';
import '../config/consts.dart';
import '../utility/utility.dart';
import 'network_logger.dart';

enum ServerMethods { GET, POST, UPDATE, DELETE, PUT, PATCH }

class Network {
  static Network? _instance;
  static final Dio _dio = Dio();
  Network._private();

  factory Network() {
    if (_instance == null) {
      _dio.options.connectTimeout = const Duration(seconds: 15);
      _dio.interceptors.add(NetworkLogger.logger);
      _instance = Network._private();
    }
    return _instance!;
  }

  Future<dynamic> request(
    String endpoint, {
    bodyParms,
    Map<String, dynamic>? queryParms,
    Map<String, dynamic>? header,
    ServerMethods method = ServerMethods.GET,
  }) async {
    String token = "";

    _dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    if (header != null) {
      _dio.options.headers.addAll(header);
    }
    try {
      Response response = await _dio.request(
        Consts.biseUrl + endpoint,
        data: bodyParms,
        queryParameters: queryParms,
        options: Options(method: method.name),
      );
      return response;
    } on SocketException catch (e) {
      cprint(
        "SocketException: ${e.address}",
        errorIn: Consts.biseUrl + endpoint,
        label: "SocketException",
      );
      cprint("└------------------------------------------------------------------------------");
      cprint("================================================================================");
      rethrow;
    } on DioException catch (e) {
      cprint(
        "| Error: ${e.error}: ${e.response?.toString()}",
        errorIn: Consts.biseUrl + endpoint,
        label: "DioError",
      );
      cprint("└------------------------------------------------------------------------------");
      cprint("================================================================================");
    } catch (error) {
      cprint(
        "Unhandled Exception: $error",
        errorIn: Consts.biseUrl + endpoint,
        label: "Unhandled Exception",
      );
      cprint("└------------------------------------------------------------------------------");
      cprint("================================================================================");
      rethrow;
    }
  }
}
