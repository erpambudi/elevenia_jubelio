import 'package:dartz/dartz.dart';
import 'package:elevenia_jubelio/domain/entities/product_detail.dart';

import '../../common/utils/failure.dart';
import '../repositories/cart_repository.dart';

class SaveCartProduct {
  final CartRepository repository;

  SaveCartProduct(this.repository);

  Future<Either<Failure, String>> execute(ProductDetail product) {
    return repository.saveProduct(product);
  }
}
