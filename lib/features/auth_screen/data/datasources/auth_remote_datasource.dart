import 'dart:io';

import 'package:bidly/core/errors/exception.dart';
import 'package:bidly/core/utils/app_apis.dart';
import 'package:bidly/features/auth_screen/data/models/user_register_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String userName,
    required String email,
    required String password,
  });
  Future<String> logInWithEmailPassword({
    required String email,
    required String password,
  });
  Future<String> verifyEmailOtp({
    required String email,
    required String token,
    required OtpType type,
  });

  Future<String> resetPassword({
    required String email,
  });

  Future<String> changePassword({
    required String newPassword,
  });

  Future<UserRegisterModel> saveTodb({
    required String userId,
    required String userName,
    required String email,
  });

  Future<String> logOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl({required this.supabaseClient});
  @override
  Future<String> signUpWithEmailPassword({
    required String userName,
    required String email,
    required String password,
  }) async {
    debugPrint(
        '[AuthRemoteDataSource] Starting signUpWithEmailPassword for $email');
    try {
      debugPrint('[AuthRemoteDataSource] Calling supabaseClient.auth.signUp');
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'userName': userName,
        },
      );
      debugPrint('- User: ${response.user}');
      if (response.user == null) {
        throw const ServerException('User is null');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw const ServerException('User is null');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException('Login failed: ${e.toString()}');
    }
  }

  @override
  Future<String> verifyEmailOtp({
    required String email,
    required String token,
    required OtpType type,
  }) async {
    try {
      final response = await supabaseClient.auth.verifyOTP(
        type: type,
        email: email,
        token: token,
      );
      if (response.user == null) {
        throw const ServerException('OTP verification failed: User is null');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException('OTP verification failed: ${e.toString()}');
    }
  }

  @override
  Future<String> resetPassword({required String email}) async {
    try {
      await supabaseClient.auth.resetPasswordForEmail(email);
      return 'Password reset email sent successfully to $email';
    } catch (e) {
      throw ServerException('Password reset failed: ${e.toString()}');
    }
  }

  @override
  Future<String> changePassword({required String newPassword}) async {
    try {
      final response = await supabaseClient.auth.updateUser(
        UserAttributes(password: newPassword),
      );

      if (response.user == null) {
        throw const ServerException('Failed to update password: User is null');
      }

      return 'Password updated successfully';
    } catch (e) {
      throw ServerException('Change password failed: ${e.toString()}');
    }
  }

  @override
  Future<String> logOut() async {
    try {
      await supabaseClient.auth.signOut();
      return 'Logged out successfully';
    } catch (e) {
      throw ServerException('Logout failed: ${e.toString()}');
    }
  }

  @override
  Future<UserRegisterModel> saveTodb(
      {required String userId,
      required String userName,
      required String email}) async {
    final AppApis api = AppApis();

    try {
      final response = await api.sendRequest.post(
        AppApi.authApis.register,
        data: {
          'user_id': userId,
          'user_name': userName,
          'user_email': email,
        },
      );

      if (response.statusCode == null) {
        throw const ServerException('No status code received');
      }

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return UserRegisterModel.fromJson(response.data);
      } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
        final errorMessage = response.data is Map
            ? response.data['message']?.toString()
            : 'Client error occurred';
        throw ServerException(errorMessage ?? 'Client error occurred');
      } else {
        throw ServerException('Server error occurred: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data is Map
          ? e.response?.data['message']?.toString()
          : 'Network error occurred';
      throw ServerException(errorMessage ?? 'Network error occurred');
    } on SocketException {
      throw const NetworkException('No Internet Connection');
    } on FormatException {
      throw const DataParsingException('Bad response format');
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }
}
