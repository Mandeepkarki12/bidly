class GetUserDetailEntity {
  final bool success;
  final UserDataEntity? data; // Can be null if API fails
  final String message;

  GetUserDetailEntity({
    required this.success,
    this.data, // Not required since some API errors might not return data
    required this.message,
  });
}

class UserDataEntity {
  final String userId;       // Always present
  final String userName;     // Always present
  final String userEmail;    // Always present
  final String role;         // Always present
  final String? profileImage; // Nullable (API returns null)
  final String createdAt;    // Always present
  final String updatedAt;    // Always present
  final UserProfileEntity? profile; // Nullable (but present in this response)

  UserDataEntity({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.role,
    this.profileImage, // Not required
    required this.createdAt,
    required this.updatedAt,
    this.profile, // Not required
  });
}

class UserProfileEntity {
  final String profileId;    // Always present
  final String? bio;         // Nullable (API returns null)
  final String? coverPicture; // Nullable (API returns null)
  final String createdAt;    // Always present
  final String updatedAt;    // Always present
  final int followerCount;   // Always present (default 0)
  final int followingCount;  // Always present (default 0)
  final List<String> socialLinks; // Always present (empty array)

  UserProfileEntity({
    required this.profileId,
    this.bio, // Not required
    this.coverPicture, // Not required
    required this.createdAt,
    required this.updatedAt,
    required this.followerCount,
    required this.followingCount,
    required this.socialLinks, // Required but can be empty
  });
}