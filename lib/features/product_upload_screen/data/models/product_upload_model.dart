class ProductUploadModel {
  bool? success;
  String? message;
  String? productImage;

  ProductUploadModel({this.success, this.message, this.productImage});

  ProductUploadModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    productImage = json['product_image'] as String?;
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'product_image': productImage,
    };
  }
}
