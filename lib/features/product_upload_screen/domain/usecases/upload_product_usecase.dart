import 'package:bidly/core/errors/failure.dart';
import 'package:bidly/core/usecases/usecase.dart';
import 'package:bidly/features/product_upload_screen/domain/entities/product_upload_entity.dart';
import 'package:bidly/features/product_upload_screen/domain/repositories/product_upload_repositories.dart';
import 'package:dartz/dartz.dart';

class UploadProductUseCase
    implements UseCaseWithParams<ProductUploadEntity, ProductParameters> {
  final ProductUploadRepositories productUploadRepositories;

  UploadProductUseCase({required this.productUploadRepositories});
  @override
  Future<Either<Failure, ProductUploadEntity>> call(params) {
    return productUploadRepositories.uploadProduct(
        userId: params.userId,
        categoryId: params.categoryId,
        tags: params.tags,
        productTitle: params.title,
        productDescription: params.description,
        productPrice: params.minimumPrice,
        productCategory: params.categoryId,
        productImage: params.productImage);
  }
}

class ProductParameters {
  final String userId;
  final String categoryId;
  final String title;
  final String description;
  final String tags;
  final String minimumPrice;
  final String productImage;

  ProductParameters({
    required this.userId,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.tags,
    required this.minimumPrice,
    required this.productImage,
  });
}
