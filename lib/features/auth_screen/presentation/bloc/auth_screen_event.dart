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

final class AuthScreenLoginEvent extends AuthScreenEvent {
  final String email;
  final String password;

  AuthScreenLoginEvent({
    required this.email,
    required this.password,
  });
}

final class AuthScreenVerifyEmailOtpEvent extends AuthScreenEvent {
  final String email;
  final String token;
  final OtpType type ;

  AuthScreenVerifyEmailOtpEvent({
    required this.type,
    required this.email,
    required this.token,
  });
}

final class AuthScreenResetPasswordEvent extends AuthScreenEvent {
  final String email;

  AuthScreenResetPasswordEvent({
    required this.email,
  });
}