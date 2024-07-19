import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final int price;
  final List images;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images
  });

  @override
  List<Object?> get props => [id, title];
}
