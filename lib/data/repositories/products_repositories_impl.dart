import 'dart:io';

import 'package:elevenia_jubelio/common/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:elevenia_jubelio/common/utils/network_info.dart';
import 'package:elevenia_jubelio/data/models/product_table.dart';
import 'package:elevenia_jubelio/domain/entities/product_detail.dart';
import 'package:elevenia_jubelio/domain/repositories/products_repository.dart';

import '../../common/utils/exception.dart';
import '../../domain/entities/product.dart';
import '../datasource/products_local_datasource.dart';
import '../datasource/products_remote_datasource.dart';

class ProductsRepositoriesImpl implements ProductsRepository {
  final ProductsRemoteDatasource remoteDataSource;
  final ProductsLocalDatasource localDataSource;
  final NetworkInfo networkInfo;

  ProductsRepositoriesImpl(
      {required this.remoteDataSource,
      required this.networkInfo,
      required this.localDataSource});

  @override
  Future<Either<Failure, List<Product>>> getProducts(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getProducts(page);
        localDataSource.cacheProducts(
            result.map((e) => ProductTable.fromModel(e)).toList());
        final products = result.map((e) => e.toEntity()).toList();
        return Right(products);
      } on ServerException {
        return const Left(ServerFailure('Server Problem'));
      }
    } else {
      try {
        final result = await localDataSource.getCachedProducts();
        return Right(result.map((e) => e.toEntity()).toList());
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, ProductDetail>> getDetailProduct(int id) async {
    try {
      final result = await remoteDataSource.getDetailProduct(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Problem'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
