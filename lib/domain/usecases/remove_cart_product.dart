import 'package:dartz/dartz.dart';

import '../../common/utils/failure.dart';
import '../entities/cart.dart';
import '../repositories/cart_repository.dart';

class RemoveCartProduct {
  final CartRepository repository;

  RemoveCartProduct(this.repository);

  Future<Either<Failure, String>> execute(Cart cart) {
    return repository.removeProduct(cart);
  }
}
