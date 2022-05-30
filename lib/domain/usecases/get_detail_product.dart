import 'package:dartz/dartz.dart';
import 'package:elevenia_jubelio/domain/entities/product_detail.dart';

import '../../common/utils/failure.dart';
import '../repositories/products_repository.dart';

class GetDetailProduct {
  final ProductsRepository repository;

  GetDetailProduct(this.repository);

  Future<Either<Failure, ProductDetail>> execute(String id) {
    return repository.getDetailProduct(id);
  }
}
