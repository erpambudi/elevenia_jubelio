import 'package:dartz/dartz.dart';
import 'package:elevenia_jubelio/domain/entities/product.dart';

import '../../common/utils/failure.dart';
import '../repositories/products_repository.dart';

class GetProducts {
  final ProductsRepository repository;

  GetProducts(this.repository);

  Future<Either<Failure, List<Product>>> execute(int page) {
    return repository.getProducts(page);
  }
}
