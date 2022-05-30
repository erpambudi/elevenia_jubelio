import 'package:dartz/dartz.dart';
import 'package:elevenia_jubelio/domain/entities/product.dart';
import 'package:elevenia_jubelio/domain/entities/product_detail.dart';

import '../../common/utils/failure.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts(int page);
  Future<Either<Failure, ProductDetail>> getDetailProduct(int id);
}
