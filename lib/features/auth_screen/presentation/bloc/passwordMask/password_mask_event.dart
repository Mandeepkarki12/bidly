part of 'password_mask_bloc.dart';

@immutable
sealed class PasswordMaskEvent {}
final class PasswordMaskToggle extends PasswordMaskEvent {
  final bool isVisible;

  PasswordMaskToggle({required this.isVisible});
}
