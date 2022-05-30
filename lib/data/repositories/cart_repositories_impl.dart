import 'package:dartz/dartz.dart';
import 'package:elevenia_jubelio/data/models/cart_table.dart';
import 'package:elevenia_jubelio/domain/entities/product_detail.dart';

import '../../common/utils/exception.dart';
import '../../common/utils/failure.dart';
import '../../domain/entities/cart.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasource/products_local_datasource.dart';

class CartRepositoriesImpl implements CartRepository {
  final ProductsLocalDatasource localDataSource;

  CartRepositoriesImpl({required this.localDataSource});

  @override
  Future<Either<Failure, String>> saveProduct(ProductDetail product) async {
    try {
      final result = await localDataSource
          .insertProduct(CartTable.fromProductEntity(product));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Failure, List<Cart>>> getCartData() async {
    try {
      final result = await localDataSource.getCartData();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Failure, String>> removeProduct(Cart cart) async {
    try {
      final result =
          await localDataSource.removeProduct(CartTable.fromCartEntity(cart));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Failure, String>> updateQuantity(
      Cart cart, int quantity) async {
    try {
      final result = await localDataSource.updateQuantity(
          CartTable.fromCartEntity(cart), quantity);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> isAddedToCart(String id) async {
    final result = await localDataSource.getProductById(id);
    return (result != null);
  }
}
