import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/core/mapper/ProfileMapper/get_user_detail_mapper.dart';
import 'package:bidly/features/profile_screen/data/datasources/profile_datasource.dart';

import 'package:bidly/features/profile_screen/domain/entities/get_user_detail_entity.dart';
import 'package:bidly/features/profile_screen/domain/repositories/profile_repositories.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoriesImpl implements ProfileRepositories {
  final ProfileDataSource profileDataSource;
  ProfileRepositoriesImpl({required this.profileDataSource});
  @override
  Future<Either<Failure, GetUserDetailEntity>> getUserDetails(
      {required String userId}) async {
    try {
      final result = await profileDataSource.getUserdetails(userId: userId);
      return Right(UserDetailMapper.toUserDetailEntity(result));
    } on Exception catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
