import 'package:dio/dio.dart';
import '../../model/model_product.dart';

abstract interface class ProductService {
  Future<List<ProductModel>> getProducts();
}

class ProductServiceImp implements ProductService {
  final Dio dio;

  ProductServiceImp({required this.dio});

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get('https://dummyjson.com/products');

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<ProductModel> products = response.data!["products"]
          .map<ProductModel>(
              (e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return products;
    } else {
      throw DioException(
        type: DioExceptionType.badResponse,
        error: response.statusMessage,
        requestOptions: response.requestOptions,
        response: response,
        message: response.statusMessage,
      );
    }
  }
}
