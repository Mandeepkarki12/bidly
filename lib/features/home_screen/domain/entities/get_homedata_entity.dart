class GetHomeDataEntity {
  final bool success;
  final HomeDataEntity? data;
  final String? message;

  const GetHomeDataEntity({
    required this.success,
    this.data,
    this.message,
  });
}

class HomeDataEntity {
  final TopUserEntity? topUser;
  final List<ProductEntity> allProducts;
  final List<ProductEntity> trending;
  final ProductEntity? topOne;
  final List<CategoryEntity> categories;

  const HomeDataEntity({
    this.topUser,
    required this.allProducts,
    required this.trending,
    this.topOne,
    required this.categories,
  });
}

class ProductEntity {
  final String productId;
  final String sellerId;
  final String categoryId;
  final String title;
  final bool isSold;
  final String description;
  final String productImage;
  final DateTime postedOn;
  final double minimumPrice;
  final String tags;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String sellerName;
  final String? sellerProfileImage;
  final String categoryName;

  const ProductEntity({
    required this.productId,
    required this.sellerId,
    required this.categoryId,
    required this.title,
    required this.isSold,
    required this.description,
    required this.productImage,
    required this.postedOn,
    required this.minimumPrice,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
    required this.sellerName,
    this.sellerProfileImage,
    required this.categoryName,
  });
}

class CategoryEntity {
  final String categoryId;
  final String name;
  final String description;

  const CategoryEntity({
    required this.categoryId,
    required this.name,
    required this.description,
  });
}

class TopUserEntity {
  final String userId;
  final String userName;
  final String userEmail;
  final String? profileImage;
  final String role;
  final String? bio;
  final int productCount;

  const TopUserEntity({
    required this.userId,
    required this.userName,
    required this.userEmail,
    this.profileImage,
    required this.role,
    this.bio,
    required this.productCount,
  });
}
