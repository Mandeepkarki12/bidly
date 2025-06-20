import 'package:bidly/core/errors/exception.dart';
import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/features/auth_screen/data/datasources/auth_remote_datasource.dart';
import 'package:bidly/features/auth_screen/data/models/user_register_model.dart';
import 'package:bidly/features/auth_screen/data/models/user_verify_model.dart';
import 'package:bidly/features/auth_screen/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRemoteRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, String>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userId = await authRemoteDataSource.logInWithEmailPassword(
        email: email,
        password: password,
      );

      return Right(userId);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      final userId = await authRemoteDataSource.signUpWithEmailPassword(
        userName: userName,
        email: email,
        password: password,
      );
      debugPrint(userId);
      return Right(userId);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> verifyEmailOtp(
      {required String email,
      required String token,
      required OtpType type}) async {
    try {
      final userId = await authRemoteDataSource.verifyEmailOtp(
        type: type,
        email: email,
        token: token,
      );
      return Right(userId);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword({required String email}) async {
    try {
      final message = await authRemoteDataSource.resetPassword(email: email);
      return Right(message);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> changePassword(
      {required String newPassword}) async {
    try {
      final message = await authRemoteDataSource.changePassword(
        newPassword: newPassword,
      );
      return Right(message);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> logOut() async {
    try {
      final message = await authRemoteDataSource.logOut();
      return Right(message);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserRegisterModel>> saveTodb(
      {required String userId,
      required String userName,
      required String userEmail}) async {
    try {
      final result = await authRemoteDataSource.saveTodb(
          userId: userId, userName: userName, email: userEmail);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserVerifyModel>> verifyUser(
      {required String userId}) async {
    try {
      final result = await authRemoteDataSource.verifyUser(userId: userId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
