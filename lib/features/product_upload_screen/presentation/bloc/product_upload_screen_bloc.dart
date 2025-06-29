import 'package:bidly/features/product_upload_screen/domain/entities/product_upload_entity.dart';
import 'package:bidly/features/product_upload_screen/domain/usecases/upload_product_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'product_upload_screen_event.dart';
part 'product_upload_screen_state.dart';

class ProductUploadScreenBloc
    extends Bloc<ProductUploadScreenEvent, ProductUploadScreenState> {
  final UploadProductUseCase _uploadProductUseCase;
  ProductUploadScreenBloc({
    required UploadProductUseCase uploadProductUseCase,
  })  : _uploadProductUseCase = uploadProductUseCase,
        super(ProductUploadScreenInitial()) {
    on<UploadProductEvent>((event, emit) async {
      emit(ProductUploadScreenLoading());
      final result = await _uploadProductUseCase.call(ProductParameters(
        userId: event.userId,
        categoryId: event.categoryId,
        title: event.productTitle,
        description: event.productDescription,
        tags: event.tags,
        minimumPrice: event.productPrice,
        productImage: event.productImage,
      ));
      result.fold((l) => emit(ProductUploadScreenError(message: l.message)),
          (r) => emit(ProductUploadScreenLoaded(productUploadEntity: r)));
    });
  }
}
