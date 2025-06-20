import 'package:flutter/material.dart';

class GetUserDetailModel {
  bool? success;
  Data? data;
  String? message;

  GetUserDetailModel({this.success, this.data, this.message});

  GetUserDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  String? userId;
  String? userName;
  String? userEmail;
  String? role;
  String? profileImage;
  String? createdAt;
  String? updatedAt;
  Profile? profile;

  Data({
    this.userId,
    this.userName,
    this.userEmail,
    this.role,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
    this.profile,
  });

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    role = json['role'];
    profileImage = json['profile_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }
}

class Profile {
  String? profileId;
  String? bio;
  String? coverPicture;
  String? createdAt;
  String? updatedAt;
  int? followerCount;
  int? followingCount;
  List<String>? socialLinks;

  Profile({
    this.profileId,
    this.bio,
    this.coverPicture,
    this.createdAt,
    this.updatedAt,
    this.followerCount,
    this.followingCount,
    this.socialLinks,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    profileId = json['profile_id'] ?? '';
    bio = json['bio']; 
    coverPicture = json['cover_picture'];
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
    followerCount = json['follower_count'] ?? 0;
    followingCount = json['following_count'] ?? 0;

    // Safe handling of social_links
    socialLinks = (json['social_links'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];

    // Debug print to verify
    debugPrint('Profile parsed - socialLinks: $socialLinks');
  }
}
