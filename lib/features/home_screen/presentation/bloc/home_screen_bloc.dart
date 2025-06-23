import 'package:bidly/features/home_screen/domain/entities/get_homedata_entity.dart';
import 'package:bidly/features/home_screen/domain/usecases/get_homedata_usecase.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final GetHomeDataUsecase _getHomeDataUsecase;
  HomeScreenBloc({
    required GetHomeDataUsecase getHomeDataUsecase,
  })  : _getHomeDataUsecase = getHomeDataUsecase,
        super(HomeScreenInitial()) {
    on<GetHomeDataEvent>((event, emit) async {
      emit(HomeScreenLoading());
      final response = await _getHomeDataUsecase.call();
      response.fold(
        (l) => emit(HomeScreenError(message: l.message)),
        (r) => emit(HomeScreenLoaded(homeData: r)),
      );
    });
  }
}
