import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/core/usecases/usecase.dart';
import 'package:bidly/features/auth_screen/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyEmailOtp
    implements UseCaseWithParams<String, VerifyEmailOtpParams> {
  final AuthRepository authRepository;

  const VerifyEmailOtp({required this.authRepository});

  @override
  Future<Either<Failure, String>> call(VerifyEmailOtpParams params) async {
    return await authRepository.verifyEmailOtp(
      email: params.email,
      token: params.token,
    );
  }
}

class VerifyEmailOtpParams {
  final String email;
  final String token;

  VerifyEmailOtpParams({
    required this.email,
    required this.token,
  });
}
