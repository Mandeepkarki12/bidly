class UserRegisterEntity {
  final bool? success;
  final String? message;
  final UserDataEntity? data;

  UserRegisterEntity({
    this.success,
    this.message,
    this.data,
  });
}

class UserDataEntity {
  final String? userId;
  final String? userName;
  final String? userEmail;
  final bool? userVerified;

  UserDataEntity({
    this.userId,
    this.userName,
    this.userEmail,
    this.userVerified
  });
}