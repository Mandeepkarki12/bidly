import 'package:bidly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> verifyEmailOtp({
    required String email,
    required String token,
    required OtpType type,
  });

  Future<Either<Failure, String>> resetPassword({
    required String email,
  });

  Future<Either<Failure, String>> changePassword({
    required String newPassword,
  });

  Future<Either<Failure, String>> logOut();
}
