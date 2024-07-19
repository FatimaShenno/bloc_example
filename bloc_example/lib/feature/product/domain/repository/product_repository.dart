import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/entity_product.dart';


// add, delete, get, edit,..........
abstract interface class ProductRepository {
  Future<Either<Failure,List<ProductEntity>>> getProduct();
}