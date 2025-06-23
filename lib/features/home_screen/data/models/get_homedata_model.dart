class GetHomeDataModel {
  bool? success;
  Data? data;
  String? message;

  GetHomeDataModel({
    this.success,
    this.data,
    this.message,
  });
  GetHomeDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  TopUser? topUser;
  List<TopOne>? allProducts;
  List<TopOne>? trending;
  TopOne? topOne;
  List<Category>? categories;

  Data({
    this.topUser,
    this.allProducts,
    this.trending,
    this.topOne,
    this.categories,
  });

  Data.fromJson(Map<String, dynamic> json) {
    topUser =
        json['top_user'] != null ? TopUser.fromJson(json['top_user']) : null;
    if (json['all_products'] != null) {
      allProducts = <TopOne>[];
      json['all_products'].forEach((v) {
        allProducts!.add(TopOne.fromJson(v));
      });
    }
    if (json['trending'] != null) {
      trending = <TopOne>[];
      json['trending'].forEach((v) {
        trending!.add(TopOne.fromJson(v));
      });
    }
    topOne = json['top_one'] != null ? TopOne.fromJson(json['top_one']) : null;
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
  }
}

class TopOne {
  String? productId;
  String? sellerId;
  String? categoryId;
  String? title;
  int? isSold;
  String? description;
  String? productImage;
  DateTime? postedOn;
  String? minimumPrice;
  String? tags;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? sellerName;
  dynamic sellerProfileImage;
  String? categoryName;

  TopOne({
    this.productId,
    this.sellerId,
    this.categoryId,
    this.title,
    this.isSold,
    this.description,
    this.productImage,
    this.postedOn,
    this.minimumPrice,
    this.tags,
    this.createdAt,
    this.updatedAt,
    this.sellerName,
    this.sellerProfileImage,
    this.categoryName,
  });

  TopOne.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    sellerId = json['seller_id'];
    categoryId = json['category_id'];
    title = json['title'];
    isSold = json['is_sold'];
    description = json['description'];
    productImage = json['product_image'];
    postedOn = DateTime.parse(json['posted_on']);
    minimumPrice = json['minimum_price'];
    tags = json['tags'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    sellerName = json['seller_name'];
    sellerProfileImage = json['seller_profile_image'];
    categoryName = json['category_name'];
  }
}

class Category {
  String? categoryId;
  String? name;
  String? description;

  Category({
    this.categoryId,
    this.name,
    this.description,
  });
  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    description = json['description'];
  }
}

class TopUser {
  String? userId;
  String? userName;
  String? userEmail;
  dynamic profileImage;
  String? role;
  dynamic bio;
  int? productCount;

  TopUser({
    this.userId,
    this.userName,
    this.userEmail,
    this.profileImage,
    this.role,
    this.bio,
    this.productCount,
  });

  TopUser.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    profileImage = json['profile_image'];
    role = json['role'];
    bio = json['bio'];
    productCount = json['product_count'];
  }
}
