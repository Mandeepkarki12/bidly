import 'dart:io';
import 'package:bidly/core/errors/exception.dart';
import 'package:bidly/core/utils/app_apis.dart';
import 'package:bidly/features/product_upload_screen/data/models/product_upload_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

abstract interface class ProductUploadDataSource {
  Future<ProductUploadModel> uploadProduct(
      {required String userId,
      required String categoryId,
      required String title,
      required String description,
      required String tags,
      required String minimumPrice,
      required String productImage});
}

class ProductUploadDataSourceImpl implements ProductUploadDataSource {
  final AppApis api = AppApis();
  @override
  Future<ProductUploadModel> uploadProduct({
    required String userId,
    required String categoryId,
    required String title,
    required String description,
    required String tags,
    required String minimumPrice,
    required String productImage,
  }) async {
    try {
      dio.FormData formData = dio.FormData.fromMap({
        'seller_id': userId,
        'category_id': categoryId,
        'title': title,
        'description': description,
        'minimum_price': minimumPrice,
        'tags': tags,
        'product_image': await dio.MultipartFile.fromFile(
          productImage,
          filename: productImage.split('/').last,
        ),
      });

      final response = await api.sendRequest.post(
        AppApi.uploadProductApis.uploadProduct,
        data: formData,
      );

      if (response.statusCode == null) {
        throw const ServerException('No status code received');
      }

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ProductUploadModel.fromJson(response.data);
      } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
        final errorMessage = response.data is Map
            ? response.data['message']?.toString()
            : 'Client error occurred';
        throw ServerException(errorMessage ?? 'Client error occurred');
      } else {
        throw ServerException('Server error occurred: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data is Map
          ? e.response?.data['message']?.toString()
          : 'Network error occurred';
      throw ServerException(errorMessage ?? 'Network error occurred');
    } on SocketException {
      throw const NetworkException('No Internet Connection');
    } on FormatException {
      throw const DataParsingException('Bad response format');
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }
}
