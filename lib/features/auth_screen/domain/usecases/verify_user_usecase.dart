import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/core/usecases/usecase.dart';
import 'package:bidly/features/auth_screen/data/models/user_verify_model.dart';
import 'package:bidly/features/auth_screen/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyUserUsecase
    implements UseCaseWithParams<UserVerifyModel, VerifyParameter> {
  final AuthRepository authRepository;
  const VerifyUserUsecase({required this.authRepository});
  @override
  Future<Either<Failure, UserVerifyModel>> call(VerifyParameter params) async {
    return await authRepository.verifyUser(userId: params.userId);
  }
}

class VerifyParameter {
  final String userId;
  const VerifyParameter({required this.userId});
}
