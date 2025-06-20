part of 'profile_screen_bloc.dart';

@immutable
sealed class ProfileScreenEvent {}

class GetUserDetailEvent extends ProfileScreenEvent {
  final String userId;
  GetUserDetailEvent({required this.userId});
}
