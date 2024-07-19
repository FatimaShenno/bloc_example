import 'package:bloc_example/feature/product/presentation/bloc/product_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'feature/product/data/data_source/remote/product_services.dart';
import 'feature/product/data/repository/repository_imp_product.dart';
import 'feature/product/domain/repository/product_repository.dart';
import 'feature/product/domain/use_case/get_products.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Dio, hive, sharedpreferance, firebase ........ (not factory)
  sl.registerLazySingleton<Dio>(() => Dio());
  _initProduct();
}

_initProduct() {
  //data sources
  sl
    ..registerFactory<ProductService>(
      () => ProductServiceImp(dio: sl()),
    )
    //repository
    ..registerFactory<ProductRepository>(
      () => ProductRepositoryImp(productService: sl()),
    )
    //use cases
    ..registerFactory(
      () => GetProductsUseCase(productReposotiry: sl()),
    )
    //bloc
    ..registerLazySingleton<ProductBloc>(
      () => ProductBloc(getProductUseCase: sl()),
    );
}
