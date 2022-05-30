import 'package:elevenia_jubelio/data/datasource/db/database_helper.dart';
import 'package:elevenia_jubelio/data/models/cart_table.dart';

import '../../common/utils/exception.dart';
import '../models/product_table.dart';

abstract class ProductsLocalDatasource {
  Future<void> cacheProducts(List<ProductTable> products);
  Future<List<ProductTable>> getCachedProducts();
  Future<String> insertProduct(CartTable product);
  Future<String> removeProduct(CartTable product);
  Future<CartTable?> getProductById(String id);
  Future<List<CartTable>> getCartData();
  Future<String> updateQuantity(CartTable product, int quantity);
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

  @override
  Future<String> insertProduct(CartTable product) async {
    try {
      await databaseHelper.insertCartTable(product);
      return 'Added to Cart';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeProduct(CartTable product) async {
    try {
      await databaseHelper.removeCartTable(product);
      return 'Removed from Cart';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<CartTable?> getProductById(String id) async {
    final result = await databaseHelper.getCartTableById(id);
    if (result != null) {
      return CartTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<CartTable>> getCartData() async {
    final result = await databaseHelper.getCartData();
    return result.map((data) => CartTable.fromMap(data)).toList();
  }

  @override
  Future<String> updateQuantity(CartTable product, int quantity) async {
    try {
      await databaseHelper.updateQty(product, quantity);
      return 'Quantity Updated';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
