import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/features/home_screen/domain/entities/get_homedata_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class HomeRepositories {
  Future<Either<Failure, GetHomeDataEntity>> getHomeData();
}
