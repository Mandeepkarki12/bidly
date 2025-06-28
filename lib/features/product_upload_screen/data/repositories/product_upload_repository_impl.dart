import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/core/mapper/product_upload_mapper/product_upload_mapper.dart';
import 'package:bidly/features/product_upload_screen/data/datasources/product_upload_datasource.dart';
import 'package:bidly/features/product_upload_screen/domain/entities/product_upload_entity.dart';
import 'package:bidly/features/product_upload_screen/domain/repositories/product_upload_repositories.dart';
import 'package:dartz/dartz.dart';

class ProductUploadRepositoryImpl implements ProductUploadRepositories {
  final ProductUploadDataSource productUploadDataSource;

  ProductUploadRepositoryImpl({required this.productUploadDataSource});

  @override
  Future<Either<Failure, ProductUploadEntity>> uploadProduct(
      {required String userId,
      required String categoryId,
      required String tags,
      required String productTitle,
      required String productDescription,
      required String productPrice,
      required String productCategory,
      required String productImage}) async {
    try {
      final result = await productUploadDataSource.uploadProduct(
        userId: userId,
        categoryId: categoryId,
        title: productTitle,
        description: productDescription,
        tags: tags,
        minimumPrice: productPrice,
        productImage: productImage,
      );

      return Right(ProductUploadMapper.toEntity(result));
    } on Exception catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
