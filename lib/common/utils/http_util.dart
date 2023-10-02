import 'package:dio/dio.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() => _instance;

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://192.168.43.118:8000/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      responseType: ResponseType.json,
      headers: {},
      contentType: 'application/json: charset=utf-8',
    );
    dio = Dio(options);
  }

  // post
  Future<void> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
  }) async {
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameter,
    );
    print("Response ${response.toString()}");
    return response.data;
  }

  // get
  Future<void> get(
    String path, {
    Map<String, dynamic>? queryParameter,
  }) async {
    var response = await dio.get(
      path,
      queryParameters: queryParameter,
    );
    print("Response Data: ${response.toString()}");
    return response.data;
  }
}
