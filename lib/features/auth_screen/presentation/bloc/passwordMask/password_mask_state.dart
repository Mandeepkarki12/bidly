part of 'password_mask_bloc.dart';

@immutable
sealed class PasswordMaskState {}

final class PasswordMaskInitial extends PasswordMaskState {}

final class PasswordMaskVisible extends PasswordMaskState {
  final bool isVisible;

  PasswordMaskVisible({required this.isVisible});
}
