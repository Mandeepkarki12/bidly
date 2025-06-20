import 'package:bidly/features/profile_screen/data/models/get_user_detail_model.dart';
import 'package:bidly/features/profile_screen/domain/entities/get_user_detail_entity.dart';

class UserDetailMapper {
  static GetUserDetailEntity toUserDetailEntity(GetUserDetailModel model) {
    return GetUserDetailEntity(
      success: model.success ?? false, // Fallback for null
      message: model.message ?? '', // Fallback for null
      data: model.data != null ? toUserDataEntity(model.data!) : null,
    );
  }

  static UserDataEntity toUserDataEntity(Data model) {
    return UserDataEntity(
      userId: model.userId ?? '', // Required, fallback empty string
      userName: model.userName ?? '', // Required, fallback empty string
      userEmail: model.userEmail ?? '', // Required, fallback empty string
      role: model.role ?? '', // Required, fallback empty string
      profileImage: model.profileImage, // Nullable, pass through as-is
      createdAt: model.createdAt ?? '', // Required, fallback empty string
      updatedAt: model.updatedAt ?? '', // Required, fallback empty string
      profile:
          model.profile != null ? toUserProfileEntity(model.profile!) : null,
    );
  }

  static UserProfileEntity toUserProfileEntity(Profile model) {
    return UserProfileEntity(
      profileId: model.profileId ?? '', // Required, fallback empty string
      bio: model.bio, // Nullable, pass through
      coverPicture: model.coverPicture, // Nullable, pass through
      createdAt: model.createdAt ?? '', // Required, fallback empty string
      updatedAt: model.updatedAt ?? '', // Required, fallback empty string
      followerCount: model.followerCount ?? 0, // Required, fallback 0
      followingCount: model.followingCount ?? 0, // Required, fallback 0
      socialLinks:
          model.socialLinks ?? const [], // Required, fallback empty list
    );
  }
}
