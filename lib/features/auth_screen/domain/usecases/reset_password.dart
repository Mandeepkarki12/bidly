import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/core/usecases/usecase.dart';
import 'package:bidly/features/auth_screen/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ResetPassword implements UseCaseWithParams<String, ResetPasswordParams> {
  final AuthRepository authRepository;

  const ResetPassword({required this.authRepository});

  @override
  Future<Either<Failure, String>> call(ResetPasswordParams params) async {
    return await authRepository.resetPassword(email: params.email);
  }
}

class ResetPasswordParams {
  final String email;

  ResetPasswordParams({required this.email});
}
