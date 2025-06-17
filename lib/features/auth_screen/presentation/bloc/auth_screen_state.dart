part of 'auth_screen_bloc.dart';

@immutable
sealed class AuthScreenState {}

final class AuthScreenInitial extends AuthScreenState {}

final class AuthScreenLoading extends AuthScreenState {}

final class AuthScreenSucess extends AuthScreenState {
  final String userId;

  AuthScreenSucess({required this.userId});
}

final class AuthScreenSavetodbSucess extends AuthScreenState {
  final UserRegisterModel userRegisterModel;

  AuthScreenSavetodbSucess({required this.userRegisterModel});
}

final class AuthScreenVerifySucess extends AuthScreenState {
  final UserVerifyModel userVerifyModel;

  AuthScreenVerifySucess({required this.userVerifyModel});
}

final class AuthScreenFailure extends AuthScreenState {
  final String message;

  AuthScreenFailure({required this.message});
}
