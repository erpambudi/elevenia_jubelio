import 'package:dartz/dartz.dart';

import '../../common/utils/failure.dart';
import '../entities/cart.dart';
import '../repositories/cart_repository.dart';

class GetCartProducts {
  final CartRepository repository;

  GetCartProducts(this.repository);

  Future<Either<Failure, List<Cart>>> execute() {
    return repository.getCartData();
  }
}
