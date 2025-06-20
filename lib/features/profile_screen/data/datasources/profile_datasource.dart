import 'dart:io';

import 'package:bidly/core/errors/exception.dart';
import 'package:bidly/core/utils/app_apis.dart';

import 'package:bidly/features/profile_screen/data/models/get_user_detail_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract interface class ProfileDataSource {
  Future<GetUserDetailModel> getUserdetails({required String userId});
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final AppApis api = AppApis();
  @override
  Future<GetUserDetailModel> getUserdetails({required String userId}) async {
    try {
      final response = await api.sendRequest.get(
        AppApi.profileApis.userDetails(userId),
      );

      // Validate response exists
      if (response.statusCode == null) {
        throw const ServerException('No status code received');
      }

      // Validate successful response
      if (response.statusCode == 200) {
        // Validate response data
        if (response.data == null) {
          throw const DataParsingException('Response body is null');
        }
        if (response.data is! Map<String, dynamic>) {
          throw const DataParsingException('Invalid response format');
        }

        debugPrint('User Details Response: ${response.data}');
        return GetUserDetailModel.fromJson(response.data);
      }
      // Handle error responses
      else if (response.statusCode! >= 400 && response.statusCode! < 500) {
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
      print('exception is from top server exception');
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
