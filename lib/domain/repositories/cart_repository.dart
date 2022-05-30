import 'package:dartz/dartz.dart';
import 'package:elevenia_jubelio/domain/entities/product_detail.dart';

import '../../common/utils/failure.dart';
import '../entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, String>> saveProduct(ProductDetail product);
  Future<Either<Failure, String>> removeProduct(Cart cart);
  Future<Either<Failure, List<Cart>>> getCartData();
  Future<Either<Failure, String>> updateQuantity(Cart cart, int quantity);
  Future<bool> isAddedToCart(String id);
}
