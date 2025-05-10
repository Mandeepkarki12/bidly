import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_screen_event.dart';
part 'auth_screen_state.dart';

class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {
  AuthScreenBloc() : super(AuthScreenInitial()) {
    on<AuthScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
