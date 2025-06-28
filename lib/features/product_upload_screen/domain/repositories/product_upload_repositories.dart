import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/features/product_upload_screen/domain/entities/product_upload_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class ProductUploadRepositories {
  Future<Either<Failure, ProductUploadEntity>> uploadProduct({
    required String userId,
    required String categoryId,
    required String tags,
    required String productTitle,
    required String productDescription,
    required String productPrice,
    required String productCategory,
    required String productImage,
  });
}
