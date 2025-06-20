import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/core/usecases/usecase.dart';
import 'package:bidly/features/profile_screen/domain/entities/get_user_detail_entity.dart';
import 'package:bidly/features/profile_screen/domain/repositories/profile_repositories.dart';
import 'package:dartz/dartz.dart';

class GetUserDetailUsecase
    implements UseCaseWithParams<GetUserDetailEntity, String> {
  final ProfileRepositories profileRepositories;
  GetUserDetailUsecase({required this.profileRepositories});
  @override
  Future<Either<Failure, GetUserDetailEntity>> call(String params) {
    return profileRepositories.getUserDetails(userId: params);
  }
}
