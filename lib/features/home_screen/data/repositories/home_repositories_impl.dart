import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/core/mapper/HomeMapper/get_homedata_mapper.dart';
import 'package:bidly/features/home_screen/data/datasources/home_data_source.dart';
import 'package:bidly/features/home_screen/domain/entities/get_homedata_entity.dart';
import 'package:bidly/features/home_screen/domain/repositories/home_repositories.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoriesImpl implements HomeRepositories {
  final HomeDataSource homeDataSource;
  HomeRepositoriesImpl({required this.homeDataSource});
  @override
  Future<Either<Failure, GetHomeDataEntity>> getHomeData() async {
    try {
      final result = await homeDataSource.getHomeData();
      return Right(HomeDataMapper.toHomeDataEntity(result));
    } on Exception catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
