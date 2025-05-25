import 'package:bidly/features/auth_screen/domain/usecases/user_signup.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

part 'auth_screen_event.dart';
part 'auth_screen_state.dart';

class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {
  final UserSignup _userSignup;
  AuthScreenBloc({
    required UserSignup userSignup,
  })  : _userSignup = userSignup,
        super(AuthScreenInitial()) {
    on<AuthScreenSignupEvent>((event, emit) async {
      final response = await _userSignup(UserSignupParameters(
          userName: event.userName,
          email: event.userName,
          password: event.password));
      response.fold((failure) {
        emit(AuthScreenFailure(message: failure.message));
      }, (success) {
        emit(AuthScreenSucess(userId: success));
      });
    });
  }
}
