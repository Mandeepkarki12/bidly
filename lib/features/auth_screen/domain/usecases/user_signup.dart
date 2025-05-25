import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/core/usecases/usecase.dart';
import 'package:bidly/features/auth_screen/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UserSignup implements UseCaseWithParams<String, UserSignupParameters> {
  final AuthRepository authRepository;
  const UserSignup({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(UserSignupParameters params) async {
    return await authRepository.signUpWithEmailAndPassword(
        userName: params.userName,
        email: params.email,
        password: params.password);
  }
}

class UserSignupParameters {
  final String userName;
  final String email;
  final String password;

  UserSignupParameters({
    required this.userName,
    required this.email,
    required this.password,
  });
}
