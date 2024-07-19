part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {
  const ProductEvent();
}

class ProductEventFitch extends ProductEvent {
  const ProductEventFitch();
}
