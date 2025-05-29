import 'package:bidly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class UseCaseWithParams<SuceessType, Params> {
  Future<Either<Failure, SuceessType>> call(Params params);
}

abstract interface class UseCaseWithoutParams<SuceessType> {
  Future<Either<Failure, SuceessType>> call();
}
