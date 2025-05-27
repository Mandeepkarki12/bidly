import 'package:bidly/core/errors/exception.dart';
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
  });
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
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'userName': userName,
        },
      );
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
  }) async {
    try {
      final response = await supabaseClient.auth.verifyOTP(
        type: OtpType.signup,
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
}
