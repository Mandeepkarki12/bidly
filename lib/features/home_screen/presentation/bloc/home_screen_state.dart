part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoaded extends HomeScreenState {
  final GetHomeDataEntity homeData;

  HomeScreenLoaded({required this.homeData});
}

class HomeScreenError extends HomeScreenState {
  final String message;

  HomeScreenError({required this.message});
}
