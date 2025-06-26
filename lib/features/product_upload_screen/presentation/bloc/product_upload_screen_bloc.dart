import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_upload_screen_event.dart';
part 'product_upload_screen_state.dart';

class ProductUploadScreenBloc extends Bloc<ProductUploadScreenEvent, ProductUploadScreenState> {
  ProductUploadScreenBloc() : super(ProductUploadScreenInitial()) {
    on<ProductUploadScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
