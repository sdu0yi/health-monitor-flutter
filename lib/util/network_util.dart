import 'dart:io';

import 'package:dio/dio.dart';

class NetworkUtil {
  static late Dio _instance;
  static late BaseOptions _options;

  static Future initialize({Map<String, dynamic>? headers}) async {
    _instance = Dio();
    _options = BaseOptions(
      baseUrl: 'http://47.100.74.245/api',
      connectTimeout: 7500,
      receiveTimeout: 7500,
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
    return await _instance.post(path, data: data, queryParameters: queryParameters);
  }
}
