import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'password_mask_event.dart';
part 'password_mask_state.dart';

class PasswordMaskBloc extends Bloc<PasswordMaskEvent, PasswordMaskState> {
  PasswordMaskBloc() : super(PasswordMaskInitial()) {
    on<PasswordMaskToggle>((event, emit) {
      emit(PasswordMaskVisible(isVisible: event.isVisible));
    });
  }
}
