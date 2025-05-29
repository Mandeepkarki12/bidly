import 'dart:math';

import 'package:bidly/features/auth_screen/domain/usecases/change_password.dart';
import 'package:bidly/features/auth_screen/domain/usecases/logout.dart';
import 'package:bidly/features/auth_screen/domain/usecases/reset_password.dart';
import 'package:bidly/features/auth_screen/domain/usecases/user_login.dart';
import 'package:bidly/features/auth_screen/domain/usecases/user_signup.dart';
import 'package:bidly/features/auth_screen/domain/usecases/verify_email_otp.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_screen_event.dart';
part 'auth_screen_state.dart';

class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {
  final UserSignup _userSignup;
  final UserLogin _userLogin;
  final VerifyEmailOtp _verifyEmailOtp;
  final ResetPassword _resetPassword;
  final ChangePassword _changePassword;
  final LogOut _signOut;

  AuthScreenBloc({
    required UserSignup userSignup,
    required UserLogin userLogin,
    required VerifyEmailOtp verifyEmailOtp,
    required ResetPassword resetPassword,
    required ChangePassword changePassword,
    required LogOut signOut,
  })  : _userSignup = userSignup,
        _userLogin = userLogin,
        _verifyEmailOtp = verifyEmailOtp,
        _resetPassword = resetPassword,
        _changePassword = changePassword,
        _signOut = signOut,
        super(AuthScreenInitial()) {
    // SIGNUP
    on<AuthScreenSignupEvent>((event, emit) async {
      emit(AuthScreenLoading());
      final response = await _userSignup(UserSignupParameters(
        userName: event.userName,
        email: event.email,
        password: event.password,
      ));
      response.fold(
        (failure) => emit(AuthScreenFailure(message: failure.message)),
        (userId) => emit(AuthScreenSucess(userId: userId)),
      );
    });

    // LOGIN
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
        (userId) => emit(AuthScreenSucess(userId: userId)),
      );
    });

    // OTP VERIFICATION
    on<AuthScreenVerifyEmailOtpEvent>((event, emit) async {
      emit(AuthScreenLoading());
      final response = await _verifyEmailOtp(VerifyEmailOtpParams(
        type: event.type,
        email: event.email,
        token: event.token,
      ));
      response.fold(
        (failure) => emit(AuthScreenFailure(message: failure.message)),
        (userId) => emit(AuthScreenSucess(userId: userId)),
      );
    });

    // RESET PASSWORD
    on<AuthScreenResetPasswordEvent>((event, emit) async {
      emit(AuthScreenLoading());
      final response = await _resetPassword(
        ResetPasswordParams(email: event.email),
      );
      response.fold(
        (failure) => emit(AuthScreenFailure(message: failure.message)),
        (message) => emit(AuthScreenSucess(userId: message)),
      );
    });

    // cHANGE PASSWORD
    on<AuthScreenChangePasswordEvent>((event, emit) async {
      emit(AuthScreenLoading());
      final response = await _changePassword(
        ChangePasswordParams(newPassword: event.newPassword),
      );
      response.fold(
        (failure) => emit(AuthScreenFailure(message: failure.message)),
        (message) => emit(AuthScreenSucess(userId: message)),
      );
    });

    // on signout
    on<AuthScreenSignOutEvent>(
      (event, emit) async {
        emit(AuthScreenLoading());
        final response = await _signOut();
        response.fold((l) => emit(AuthScreenFailure(message: l.message)),
            (r) => AuthScreenSucess(userId: r));
      },
    );
  }
}
