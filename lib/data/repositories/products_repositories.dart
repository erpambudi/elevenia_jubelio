import 'dart:io';

import 'package:elevenia_jubelio/common/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:elevenia_jubelio/domain/entities/product_detail.dart';
import 'package:elevenia_jubelio/domain/repositories/products_repository.dart';

import '../../common/utils/exception.dart';
import '../../domain/entities/product.dart';
import '../datasource/products_remote_datasource.dart';

class ProductsRepositoriesImpl implements ProductsRepository {
  final ProductsRemoteDatasource remoteDataSource;

  ProductsRepositoriesImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getProducts(int page) async {
    try {
      final result = await remoteDataSource.getProducts(page);
      final products = result.map((e) => e.toEntity()).toList();
      return Right(products);
    } on ServerException {
      return const Left(ServerFailure('Server Problem'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
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
