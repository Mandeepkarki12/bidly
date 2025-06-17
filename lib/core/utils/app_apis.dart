import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// String baseUrl = 'http://192.168.1.77/bidly/api/'; // mandeep api base url

String baseUrl = "http://192.168.45.230/bidly_backend-main/api/"; // niraj 

class AppApis {
  final Dio _dio = Dio();
  String? accessToken;

  AppApis() {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(PrettyDioLogger());
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.connectTimeout = const Duration(seconds: 40);
    _dio.options.receiveTimeout = const Duration(seconds: 40);
  }

  Dio get sendRequest => _dio;
}

String get appApisBaseURL => AppApis()._dio.options.baseUrl;

class AppApi {
  static AuthApis authApis = AuthApis();
}

class AuthApis {
  AuthApis();
  String get register => "$appApisBaseURL/register_user.php";
}
