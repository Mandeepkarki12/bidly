import 'package:bidly/features/auth_screen/domain/entities/user_register_entity.dart';

class UserRegisterModel extends UserRegisterEntity {
  UserRegisterModel({
    bool? success,
    String? message,
    UserDataEntity? data,
  }) : super(
          success: success,
          message: message,
          data: data,
        );

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null
          ? UserRegisterDataModel.fromJson(json['data'])
          : null,
    );
  }
}

class UserRegisterDataModel extends UserDataEntity {
  UserRegisterDataModel({
    String? userId,
    String? userName,
    String? userEmail,
  }) : super(
          userId: userId,
          userName: userName,
          userEmail: userEmail,
        );

  factory UserRegisterDataModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterDataModel(
      userId: json['user_id'],
      userName: json['user_name'],
      userEmail: json['user_email'],
    );
  }
}
