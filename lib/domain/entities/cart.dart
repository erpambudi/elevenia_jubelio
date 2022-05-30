import 'package:elevenia_jubelio/data/models/cart_table.dart';

class Cart {
  final String? prdNo;
  final String? prdNm;
  final String? dispCtgrNm;
  final String? selPrc;
  final int quantity;

  Cart({
    required this.prdNo,
    required this.prdNm,
    required this.dispCtgrNm,
    required this.selPrc,
    required this.quantity,
  });

  factory Cart.fromEntity(CartTable entity) {
    return Cart(
      prdNo: entity.prdNo,
      prdNm: entity.prdNm,
      dispCtgrNm: entity.dispCtgrNm,
      selPrc: entity.selPrc,
      quantity: entity.quantity,
    );
  }
}
