import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../common/helper/xml_helper.dart';
import '../../common/utils/constants.dart';
import '../../common/utils/exception.dart';
import '../models/product_detail_model.dart';
import '../models/product_model.dart';

abstract class ProductsRemoteDatasource {
  Future<List<ProductModel>> getProducts(int page);
  Future<ProductDetailModel> getDetailProduct(String id);
}

class ProductsRemoteDatasourceImpl implements ProductsRemoteDatasource {
  @override
  Future<List<ProductModel>> getProducts(int page) async {
    final response = await http.get(
        Uri.parse('${Api.baseUrl}${Api.products}$page'),
        headers: Api.headers);

    if (response.statusCode == 200) {
      final jsonData = xmlToJson(response.body);
      final List<ProductModel> products =
          (json.decode(jsonData)['Products'] != null)
              ? (json.decode(jsonData)['Products']['product'] as List)
                  .map((e) => ProductModel.fromJson(e))
                  .toList()
              : [];
      return products;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductDetailModel> getDetailProduct(String id) async {
    final response = await http.get(Uri.parse('${Api.baseUrl}${Api.detail}$id'),
        headers: Api.headers);

    if (response.statusCode == 200) {
      final jsonData = xmlToJson(response.body);
      final product =
          ProductDetailModel.fromJson(json.decode(jsonData)['Product']);

      return product;
    } else {
      throw ServerException();
    }
  }
}
