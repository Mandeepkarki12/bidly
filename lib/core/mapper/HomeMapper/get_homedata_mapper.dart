import 'package:bidly/features/home_screen/data/models/get_homedata_model.dart';
import 'package:bidly/features/home_screen/domain/entities/get_homedata_entity.dart';

class HomeDataMapper {
  static GetHomeDataEntity toHomeDataEntity(GetHomeDataModel model) {
    return GetHomeDataEntity(
      success: model.success ?? false,
      message: model.message ?? '',
      data: model.data != null ? toDataEntity(model.data!) : null,
    );
  }

  static HomeDataEntity toDataEntity(Data model) {
    return HomeDataEntity(
      topUser: model.topUser != null ? toTopUserEntity(model.topUser!) : null,
      allProducts: model.allProducts
              ?.map((product) => toProductEntity(product))
              .toList() ??
          const [],
      trending:
          model.trending?.map((product) => toProductEntity(product)).toList() ??
              const [],
      topOne: model.topOne != null ? toProductEntity(model.topOne!) : null,
      categories: model.categories
              ?.map((category) => toCategoryEntity(category))
              .toList() ??
          const [],
    );
  }

  static ProductEntity toProductEntity(TopOne model) {
    return ProductEntity(
      productId: model.productId ?? '',
      sellerId: model.sellerId ?? '',
      categoryId: model.categoryId ?? '',
      title: model.title ?? '',
      isSold: (model.isSold ?? 0) == 1,
      description: model.description ?? '',
      productImage: model.productImage ?? '',
      postedOn: model.postedOn ?? DateTime.now(),
      minimumPrice: double.tryParse(model.minimumPrice ?? '0') ?? 0.0,
      tags: model.tags ?? '',
      createdAt: model.createdAt ?? DateTime.now(),
      updatedAt: model.updatedAt ?? DateTime.now(),
      sellerName: model.sellerName ?? '',
      sellerProfileImage: model.sellerProfileImage,
      categoryName: model.categoryName ?? '',
    );
  }

  static CategoryEntity toCategoryEntity(Category model) {
    return CategoryEntity(
      categoryId: model.categoryId ?? '',
      name: model.name ?? '',
      description: model.description ?? '',
    );
  }

  static TopUserEntity toTopUserEntity(TopUser model) {
    return TopUserEntity(
      userId: model.userId ?? '',
      userName: model.userName ?? '',
      userEmail: model.userEmail ?? '',
      profileImage: model.profileImage,
      role: model.role ?? '',
      bio: model.bio,
      productCount: model.productCount ?? 0,
    );
  }
}
