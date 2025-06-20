part of 'profile_screen_bloc.dart';

@immutable
sealed class ProfileScreenState {}

final class ProfileScreenInitial extends ProfileScreenState {}

final class ProfileScreenLoading extends ProfileScreenState {}

final class ProfileScreenSuccess extends ProfileScreenState {
  final GetUserDetailEntity userDetailEntity;
  ProfileScreenSuccess({required this.userDetailEntity});
}

final class ProfileScreenFailure extends ProfileScreenState {
  final String message;
  ProfileScreenFailure({required this.message});
}
