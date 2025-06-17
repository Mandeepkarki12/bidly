import 'package:bidly/features/auth_screen/domain/entities/user_verify_entity.dart';

class UserVerifyModel extends UserVerifyEntity {
  UserVerifyModel({
    String? status,
    String? message,
  }) : super(
          status: status,
          message: message,
        );

  factory UserVerifyModel.fromJson(Map<String, dynamic> json) =>
      UserVerifyModel(
        status: json["status"],
        message: json["message"],
      );
}
