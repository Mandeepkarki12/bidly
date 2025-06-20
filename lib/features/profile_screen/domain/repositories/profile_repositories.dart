import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/features/profile_screen/domain/entities/get_user_detail_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepositories {
  Future<Either<Failure, GetUserDetailEntity>> getUserDetails(
      {required String userId});
}
