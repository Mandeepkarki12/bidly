import 'package:bidly/core/errors/errors.dart';
import 'package:dartz/dartz.dart';

typedef ResultFuture<T> = Future<Either<ErrorResponse, T>>;

typedef Result<T> = Either<ErrorResponse, T>;

typedef ResultVoid = Either<ErrorResponse, void>;
