import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

String baseUrl = ''; // our base URL here

class AppApis {
  final Dio _dio = Dio();
  String? accessToken;

  AppApis() {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(PrettyDioLogger());
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.connectTimeout = const Duration(seconds: 40);
    _dio.options.receiveTimeout = const Duration(seconds: 40);
    _initToken();
  }

  Future<void> _initToken() async {
    // accessToken = await SecureStorageService().getValue(key: "accessToken");
    // log('API Access Token: $accessToken');
    // _dio.options.headers['Authorization'] = 'Bearer $accessToken';
  }

  Dio get sendRequest => _dio;
}

String get appApisBaseURL => AppApis()._dio.options.baseUrl;

class AppApi {

}
