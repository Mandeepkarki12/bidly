part of 'auth_screen_bloc.dart';

@immutable
sealed class AuthScreenEvent {}

final class AuthScreenSignupEvent extends AuthScreenEvent {
  final String userName;
  final String email;
  final String password;

  AuthScreenSignupEvent({
    required this.userName,
    required this.email,
    required this.password,
  });
}

