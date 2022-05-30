import '../../domain/entities/cart.dart';
import '../../domain/entities/product_detail.dart';

class CartTable {
  final String? prdNo;
  final String? prdNm;
  final String? dispCtgrNm;
  final String? selPrc;
  final int quantity;

  CartTable({
    required this.prdNo,
    required this.prdNm,
    required this.dispCtgrNm,
    required this.selPrc,
    required this.quantity,
  });

  factory CartTable.fromMap(Map<String, dynamic> map) {
    return CartTable(
      prdNo: map['prdNo'],
      prdNm: map['prdNm'],
      dispCtgrNm: map['dispCtgrNm'],
      selPrc: map['selPrc'],
      quantity: map['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
        'prdNo': prdNo,
        'prdNm': prdNm,
        'dispCtgrNm': dispCtgrNm,
        'selPrc': selPrc,
        'quantity': quantity,
      };

  factory CartTable.fromProductEntity(ProductDetail product) => CartTable(
        prdNo: product.prdNo,
        prdNm: product.prdNm,
        dispCtgrNm: product.dispCtgrNm,
        selPrc: product.selPrc,
        quantity: 1,
      );

  factory CartTable.fromCartEntity(Cart cart) => CartTable(
        prdNo: cart.prdNo,
        prdNm: cart.prdNm,
        dispCtgrNm: cart.dispCtgrNm,
        selPrc: cart.selPrc,
        quantity: 1,
      );

  Cart toEntity() {
    return Cart(
      prdNo: prdNo,
      prdNm: prdNm,
      dispCtgrNm: dispCtgrNm,
      selPrc: selPrc,
      quantity: quantity,
    );
  }
}
