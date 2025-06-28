class ProductUploadEntity {
  final bool status;
  final String message;
  final String? productImage;
  const ProductUploadEntity(
      {required this.message, required this.status, this.productImage});
}
