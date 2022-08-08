import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

class NetworkUtil {
  static late Dio _instance;
  static late BaseOptions _options;

  static Future initialize({Map<String, dynamic>? headers}) async {
    _instance = Dio();
    _options = BaseOptions(
      baseUrl: 'http://47.100.74.245/api',
      connectTimeout: 7500,
      receiveTimeout: 15000,
      headers: headers,
      contentType: ContentType.json.toString(),
    );
    _instance.options = _options;
  }

  static Dio get instance {
    return _instance;
  }

  //static <Response> getRequest<T>(String path)  async{
  // return await _instance.get(path);
  // }

  static Future<Response<T>> postRequest<T>(
      String path, dynamic data, Map<String, dynamic>? queryParameters) async {
    var response;
    try {
      response = await _instance.post(path,
          data: data, queryParameters: queryParameters);
    } on DioError catch (dioError) {
      switch (dioError.type) {
        case DioErrorType.receiveTimeout:
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
          Logger().w('${dioError.type}: ${dioError.response}');
          Fluttertoast.showToast(
              msg: "連接超時",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              fontSize: 16.0);
          break;
        case DioErrorType.response:
          break;
        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          break;
      }
    } finally {}

    return response;
  }
}
