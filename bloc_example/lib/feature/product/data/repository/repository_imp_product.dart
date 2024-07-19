import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repository/product_repository.dart';
import '../data_source/remote/product_services.dart';
import '../model/model_product.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductService _productService;

  ProductRepositoryImp({required ProductService productService})
      : _productService = productService;

  @override
  Future<Either<Failure, List<ProductModel>>> getProduct() async {
    try {
      final products = await _productService.getProducts();
      return Right(products);
    } on DioException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
