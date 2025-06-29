import 'package:bidly/features/product_upload_screen/data/models/product_upload_model.dart';
import 'package:bidly/features/product_upload_screen/domain/entities/product_upload_entity.dart';

class ProductUploadMapper {
  static ProductUploadEntity toEntity(ProductUploadModel model) {
    return ProductUploadEntity(
      status: model.success ?? false,
      message: model.message ?? '',
      productImage: model.productImage,
    );
  }
}
