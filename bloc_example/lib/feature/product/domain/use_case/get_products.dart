import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../entity/entity_product.dart';
import '../repository/product_repository.dart';

class GetProductsUseCase implements UseCase<List<ProductEntity>, void> {
  final ProductRepository _productReposotiry;
//constractor
  GetProductsUseCase({required ProductRepository productReposotiry})
      : _productReposotiry = productReposotiry;

  @override
  Future<Either<Failure, List<ProductEntity>>> call({void params}) {
    return _productReposotiry.getProduct();
  }
}
