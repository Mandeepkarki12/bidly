part of 'product_upload_screen_bloc.dart';

@immutable
abstract interface class ProductUploadScreenEvent {}

class UploadProductEvent extends ProductUploadScreenEvent {
  final String userId;
  final String categoryId;
  final String tags;
  final String productTitle;
  final String productDescription;
  final String productPrice;

  final String productImage;

  UploadProductEvent({
    required this.userId,
    required this.categoryId,
    required this.tags,
    required this.productTitle,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
  });
}
