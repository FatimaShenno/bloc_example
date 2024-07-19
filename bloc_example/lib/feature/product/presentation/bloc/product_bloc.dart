import 'package:bloc_example/feature/product/domain/use_case/get_products.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/entity_product.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, RemoteProductState> {
  final GetProductsUseCase _getProductUseCase;
  ProductBloc({required GetProductsUseCase getProductUseCase})
      : _getProductUseCase = getProductUseCase,
        super(const RemoteProductInitial()) {
    on<ProductEvent>((event, emit) => emit(const RemoteProductLoading()));
    on<ProductEventFitch>(_onProductFitch);
  }

  void _onProductFitch(
    ProductEventFitch event,
    Emitter<RemoteProductState> emit,
  ) async {
    // emit(RemoteProductLoading());
    final products = await _getProductUseCase();

    products.fold(
      (failure) => emit(RemoteProductFailure(failure.message!)),
      (products) => emit(RemoteProductSuccess(products)),
    );
  }
  // call add/ get....

//  void _onAddProductFitch(
//     ProductEventFitch event,
//     Emitter<RemoteProductState> emit,
//   ) async {
//     // emit(RemoteProductLoading());
//     final products = await _getProductUseCase();

//     products.fold(
//       (failure) => emit(RemoteProductFailure(failure.message!)),
//       (products) => emit(RemoteProductSuccess(products)),
//     );
//   }

}
