import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

String baseUrl = 'http://172.16.2.118/bidly_backend'; // mandeep api base url

// String baseUrl = "http://172.16.2.125/bidly_backend";  

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
  static ProfileApis profileApis = ProfileApis();
  static HomeApis homeApis = HomeApis();
}

class AuthApis {
  AuthApis();
  String get register => "$appApisBaseURL/api/register_user.php";
  String get verified => "$appApisBaseURL/api/verified.php";
}

class HomeApis {
  HomeApis();
  String get getHomeData => "$appApisBaseURL/api/get_homepage.php";
}

class ProfileApis {
  ProfileApis();
  String userDetails(String userId) =>
      "$appApisBaseURL/api/get_user_detail.php?id=$userId";
}
