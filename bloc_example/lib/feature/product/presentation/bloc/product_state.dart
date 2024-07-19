part of 'product_bloc.dart';

@immutable
sealed class RemoteProductState extends Equatable {
  final List<ProductEntity>? products;
  final String? error;

  const RemoteProductState({
    this.products,
    this.error,
  });

  @override
  List<Object> get props => [products!, error!];
}

final class RemoteProductInitial extends RemoteProductState {
  const RemoteProductInitial();
}

final class RemoteProductLoading extends RemoteProductState {
  const RemoteProductLoading();
}

final class RemoteProductSuccess extends RemoteProductState {
  const RemoteProductSuccess(List<ProductEntity> products)
      : super(products: products);
}

final class RemoteProductFailure extends RemoteProductState {
  const RemoteProductFailure(String error) : super(error: error);
}
