import 'package:bidly/core/errors/exception.dart';
import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/features/auth_screen/data/datasources/auth_remote_datasource.dart';
import 'package:bidly/features/auth_screen/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

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
      return Right(userId);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
