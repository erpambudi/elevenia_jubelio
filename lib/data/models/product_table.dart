import 'package:elevenia_jubelio/data/models/product_model.dart';

import '../../domain/entities/product.dart';

class ProductTable {
  final String? prdNo;
  final String? prdNm;
  final String? dispCtgrNm;
  final String? prdSelQty;
  final String? selPrc;

  ProductTable({
    required this.prdNo,
    required this.prdNm,
    required this.dispCtgrNm,
    required this.prdSelQty,
    required this.selPrc,
  });

  Map<String, dynamic> toMap() {
    return {
      'prdNo': prdNo,
      'prdNm': prdNm,
      'dispCtgrNm': dispCtgrNm,
      'prdSelQty': prdSelQty,
      'selPrc': selPrc,
    };
  }

  factory ProductTable.fromMap(Map<String, dynamic> map) {
    return ProductTable(
      prdNo: map['prdNo'],
      prdNm: map['prdNm'],
      dispCtgrNm: map['dispCtgrNm'],
      prdSelQty: map['prdSelQty'],
      selPrc: map['selPrc'],
    );
  }

  factory ProductTable.fromModel(ProductModel product) => ProductTable(
        prdNo: product.prdNo,
        prdNm: product.prdNm,
        dispCtgrNm: product.dispCtgrNm,
        prdSelQty: product.prdSelQty,
        selPrc: product.selPrc,
      );

  Product toEntity() => Product.cache(
        prdNo: prdNo,
        prdNm: prdNm,
        dispCtgrNm: dispCtgrNm,
        prdSelQty: prdSelQty,
        selPrc: selPrc,
      );

  Map<String, dynamic> toJson() => {
        'prdNo': prdNo,
        'prdNm': prdNm,
        'dispCtgrNm': dispCtgrNm,
        'prdSelQty': prdSelQty,
        'selPrc': selPrc,
      };
}
