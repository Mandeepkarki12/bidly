import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/core/usecases/usecase.dart';
import 'package:bidly/features/home_screen/domain/entities/get_homedata_entity.dart';
import 'package:bidly/features/home_screen/domain/repositories/home_repositories.dart';
import 'package:dartz/dartz.dart';

class GetHomeDataUsecase implements UseCaseWithoutParams<GetHomeDataEntity> {
  final HomeRepositories homeRepositories;

  GetHomeDataUsecase({required this.homeRepositories});

  @override
  Future<Either<Failure, GetHomeDataEntity>> call() async {
    return await homeRepositories.getHomeData();
  }
}
