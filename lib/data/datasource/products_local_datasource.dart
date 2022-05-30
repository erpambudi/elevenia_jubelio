import 'package:elevenia_jubelio/data/datasource/db/database_helper.dart';

import '../../common/utils/exception.dart';
import '../models/product_table.dart';

abstract class ProductsLocalDatasource {
  Future<void> cacheProducts(List<ProductTable> products);
  Future<List<ProductTable>> getCachedProducts();
}

class ProductsLocalDatasourceImpl implements ProductsLocalDatasource {
  final DatabaseHelper databaseHelper;

  ProductsLocalDatasourceImpl({required this.databaseHelper});

  @override
  Future<void> cacheProducts(List<ProductTable> products) async {
    await databaseHelper.clearProductCache();
    await databaseHelper.insertProductCacheTransaction(products);
  }

  @override
  Future<List<ProductTable>> getCachedProducts() async {
    final result = await databaseHelper.getCacheProducts();
    if (result.isNotEmpty) {
      return result.map((e) => ProductTable.fromMap(e)).toList();
    } else {
      throw CacheException("Can't get the data.");
    }
  }
}
