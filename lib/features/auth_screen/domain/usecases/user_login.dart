import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/core/usecases/usecase.dart';
import 'package:bidly/features/auth_screen/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UserLogin implements UseCaseWithParams<String, LoginParameters> {
  final AuthRepository authRepository;
  const UserLogin({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(LoginParameters params) async {
    return await authRepository.loginWithEmailAndPassword(
        email: params.email, password: params.password);
  }
}

class LoginParameters {
  final String email;
  final String password;

  LoginParameters({
    required this.email,
    required this.password,
  });
}
