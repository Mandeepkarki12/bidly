import 'package:bidly/features/profile_screen/domain/entities/get_user_detail_entity.dart';
import 'package:bidly/features/profile_screen/domain/usecases/get_user_detail_usecase.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

part 'profile_screen_event.dart';
part 'profile_screen_state.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  final GetUserDetailUsecase _getUserDetailUsecase;
  ProfileScreenBloc({
    required GetUserDetailUsecase getUserDetailUsecase,
  })  : _getUserDetailUsecase = getUserDetailUsecase,
        super(ProfileScreenInitial()) {
    on<GetUserDetailEvent>((event, emit) async {
      emit(ProfileScreenLoading());
      final response = await _getUserDetailUsecase.call(event.userId);
      response.fold((l) => emit(ProfileScreenFailure(message: l.message)),
          (r) => emit(ProfileScreenSuccess(userDetailEntity: r)));
    });
  }
}
