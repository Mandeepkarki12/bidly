import 'dart:io';

import 'package:bidly/core/errors/exception.dart';
import 'package:bidly/core/utils/app_apis.dart';
import 'package:bidly/features/home_screen/data/models/get_homedata_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract interface class HomeDataSource {
  Future<GetHomeDataModel> getHomeData();
}

class HomeDataSourceImpl implements HomeDataSource {
  final AppApis api = AppApis();
  @override
  Future<GetHomeDataModel> getHomeData() async {
    try {
      final response = await api.sendRequest.get(
        AppApi.homeApis.getHomeData,
      );
      if (response.statusCode == null) {
        throw const ServerException('No status code received');
      }
      if (response.statusCode == 200) {
        // Validate response data
        if (response.data == null) {
          throw const DataParsingException('Response body is null');
        }
        if (response.data is! Map<String, dynamic>) {
          throw const DataParsingException('Invalid response format');
        }

        debugPrint('Homepage Details Response: ${response.data}');
        return GetHomeDataModel.fromJson(response.data);
      } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
        final errorMessage = response.data is Map
            ? response.data['message']?.toString()
            : 'Client error occurred';
        throw ClientException(errorMessage ?? 'Client error occurred');
      } else {
        throw ServerException('Server error occurred: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw const NetworkException('Connection timeout');
      } else if (e.response?.data == null) {
        throw const DataParsingException('Empty response body');
      }

      final errorMessage = e.response?.data is Map
          ? e.response?.data['message']?.toString()
          : 'Network error occurred';

      throw ServerException(
          errorMessage ?? e.message ?? 'Network error occurred');
    } on SocketException {
      throw const NetworkException('No Internet Connection');
    } on FormatException {
      throw const DataParsingException('Bad response format');
    } catch (e) {
      debugPrint('Unexpected Error: ${e.toString()}');
      throw ServerException('Unexpected error: ${e.toString()}');
    }
  }
}
