part of 'product_upload_screen_bloc.dart';

@immutable
abstract interface class ProductUploadScreenState {}

class ProductUploadScreenInitial extends ProductUploadScreenState {}

class ProductUploadScreenLoading extends ProductUploadScreenState {}

class ProductUploadScreenLoaded extends ProductUploadScreenState {
  final ProductUploadEntity productUploadEntity;

  ProductUploadScreenLoaded({required this.productUploadEntity});
}

class ProductUploadScreenError extends ProductUploadScreenState {
  final String message;

  ProductUploadScreenError({required this.message});
}
