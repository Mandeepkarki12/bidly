import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/core/usecases/usecase.dart';
import 'package:bidly/features/auth_screen/data/models/user_register_model.dart';
import 'package:bidly/features/auth_screen/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SaveToDb implements UseCaseWithParams<UserRegisterModel, DbParameters> {
  final AuthRepository authRepository;
  const SaveToDb({required this.authRepository});
  @override
  Future<Either<Failure, UserRegisterModel>> call(DbParameters params) async {
    return await authRepository.saveTodb(
        userId: params.userId,
        userName: params.userName,
        userEmail: params.email);
  }
}

class DbParameters {
  final String userId;
  final String userName;
  final String email;

  const DbParameters({
    required this.userId,
    required this.userName,
    required this.email,
  });
}
