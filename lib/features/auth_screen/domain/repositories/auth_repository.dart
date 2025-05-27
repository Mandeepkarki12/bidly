import 'package:bidly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

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
  });
}
