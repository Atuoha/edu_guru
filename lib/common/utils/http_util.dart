import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import '../../global_config/global.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() => _instance;

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.serverAPI_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      responseType: ResponseType.json,
      headers: {},
      contentType: 'application/json: charset=utf-8',
    );
    dio = Dio(options);
  }

  // post
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? headers,
  }) async {
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameter,
      options: Options(headers: headers ?? {}),
    );
    return response.data;
  }

  // get
  Future get(
    String path, {
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? headers,
  }) async {
    var response = await dio.get(
      path,
      queryParameters: queryParameter,
      options: Options(headers: headers ?? {}),
    );
    return response.data;
  }

  // get user token
  Map<String, dynamic>? getAuthorizationHeader() {
    var header = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      header['Authorization'] = 'Bearer $accessToken';
    }
    return header;
  }
}
