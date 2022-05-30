import 'package:elevenia_jubelio/data/datasource/products_local_datasource.dart';
import 'package:elevenia_jubelio/data/repositories/products_repositories_impl.dart';
import 'package:elevenia_jubelio/domain/usecases/get_cart_status.dart';
import 'package:elevenia_jubelio/domain/usecases/get_detail_product.dart';
import 'package:elevenia_jubelio/domain/usecases/get_products.dart';
import 'package:elevenia_jubelio/presentation/bloc/cart_bloc.dart';
import 'package:elevenia_jubelio/presentation/bloc/product_detail_bloc.dart';
import 'package:elevenia_jubelio/presentation/bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'common/utils/network_info.dart';
import 'data/datasource/db/database_helper.dart';
import 'data/datasource/products_remote_datasource.dart';
import 'data/repositories/cart_repositories_impl.dart';
import 'domain/repositories/cart_repository.dart';
import 'domain/repositories/products_repository.dart';
import 'domain/usecases/get_cart_products.dart';
import 'domain/usecases/remove_cart_product.dart';
import 'domain/usecases/save_cart_product.dart';
import 'domain/usecases/update_cart_product.dart';

final locator = GetIt.instance;

void init() {
  //BLoC
  locator.registerFactory(
      () => ProductsBloc(getProducts: locator(), networkInfo: locator()));
  locator.registerFactory(() =>
      ProductDetailBloc(getDetailProduct: locator(), getCartStatus: locator()));
  locator.registerFactory(() => CartBloc(
      getCartProducts: locator(),
      saveCartProduct: locator(),
      removeCartProduct: locator(),
      updateCartProduct: locator()));

  //Use case
  locator.registerLazySingleton(() => GetProducts(locator()));
  locator.registerLazySingleton(() => GetDetailProduct(locator()));
  locator.registerLazySingleton(() => GetCartProducts(locator()));
  locator.registerLazySingleton(() => SaveCartProduct(locator()));
  locator.registerLazySingleton(() => RemoveCartProduct(locator()));
  locator.registerLazySingleton(() => UpdateCartProduct(locator()));
  locator.registerLazySingleton(() => GetCartStatus(locator()));

  //Repository
  locator.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoriesImpl(
        remoteDataSource: locator(),
        networkInfo: locator(),
        localDataSource: locator()),
  );
  locator.registerLazySingleton<CartRepository>(
      () => CartRepositoriesImpl(localDataSource: locator()));

  //Data sources
  locator.registerLazySingleton<ProductsRemoteDatasource>(
      () => ProductsRemoteDatasourceImpl());
  locator.registerLazySingleton<ProductsLocalDatasource>(
      () => ProductsLocalDatasourceImpl(databaseHelper: locator()));

  //Helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  //Network info
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  //External
  locator.registerLazySingleton(() => InternetConnectionChecker());
}
