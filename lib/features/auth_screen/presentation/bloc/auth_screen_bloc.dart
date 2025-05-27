import 'package:bidly/features/auth_screen/domain/usecases/user_login.dart';
import 'package:bidly/features/auth_screen/domain/usecases/user_signup.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

part 'auth_screen_event.dart';
part 'auth_screen_state.dart';

class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {
  final UserSignup _userSignup;
  final UserLogin _userLogin;

  AuthScreenBloc({
    required UserSignup userSignup,
    required UserLogin userLogin,
  })  : _userSignup = userSignup,
        _userLogin = userLogin,
        super(AuthScreenInitial()) {
    on<AuthScreenSignupEvent>((event, emit) async {
      emit(AuthScreenLoading());
      final response = await _userSignup(UserSignupParameters(
        userName: event.userName,
        email: event.email,
        password: event.password,
      ));
      response.fold(
        (failure) => emit(AuthScreenFailure(message: failure.message)),
        (success) => emit(AuthScreenSucess(userId: success)),
      );
    });

    on<AuthScreenLoginEvent>((event, emit) async {
      emit(AuthScreenLoading());
      final response = await _userLogin(LoginParameters(
        email: event.email,
        password: event.password,
      ));
      debugPrint(event.email);
      debugPrint(event.password);
      response.fold(
        (failure) => emit(AuthScreenFailure(message: failure.message)),
        (success) => emit(AuthScreenSucess(userId: success)),
      );
    });
  }
}
