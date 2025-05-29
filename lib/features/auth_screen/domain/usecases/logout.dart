import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/core/usecases/usecase.dart';
import 'package:bidly/features/auth_screen/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogOut implements UseCaseWithoutParams<String> {
  final AuthRepository authRepository;

  const LogOut({required this.authRepository});

  @override
  Future<Either<Failure, String>> call() async {
    return await authRepository.logOut();
  }
}
