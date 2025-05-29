import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/core/usecases/usecase.dart';
import 'package:bidly/features/auth_screen/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ChangePassword
    implements UseCaseWithParams<String, ChangePasswordParams> {
  final AuthRepository authRepository;

  const ChangePassword({required this.authRepository});

  @override
  Future<Either<Failure, String>> call(ChangePasswordParams params) async {
    return await authRepository.changePassword(newPassword: params.newPassword);
  }
}

class ChangePasswordParams {
  final String newPassword;

  ChangePasswordParams({required this.newPassword});
}
