import 'package:elevenia_jubelio/data/repositories/products_repositories.dart';
import 'package:elevenia_jubelio/domain/usecases/get_detail_product.dart';
import 'package:elevenia_jubelio/domain/usecases/get_products.dart';
import 'package:elevenia_jubelio/presentation/bloc/product_detail_bloc.dart';
import 'package:elevenia_jubelio/presentation/bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/products_remote_datasource.dart';
import 'domain/repositories/products_repository.dart';

final locator = GetIt.instance;

void init() {
  //BLoC
  locator.registerFactory(() => ProductsBloc(getProducts: locator()));
  locator.registerFactory(() => ProductDetailBloc(getDetailProduct: locator()));

  //Use case
  locator.registerLazySingleton(() => GetProducts(locator()));
  locator.registerLazySingleton(() => GetDetailProduct(locator()));

  //Repository
  locator.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoriesImpl(remoteDataSource: locator()));

  //Data sources
  locator.registerLazySingleton<ProductsRemoteDatasource>(
      () => ProductsRemoteDatasourceImpl());
}
