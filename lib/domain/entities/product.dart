import '../../data/models/product_model.dart';

class Product {
  Product({
    required this.bndlDlvCnYn,
    required this.cuponcheck,
    required this.dispCtgrNo,
    required this.dispCtgrStatCd,
    required this.exchDlvCst,
    required this.imageKindChk,
    required this.optionAllAddPrc,
    required this.outsideYnIn,
    required this.outsideYnOut,
    required this.prdAttrCd,
    required this.prdNm,
    required this.prdNo,
    required this.prdSelQty,
    required this.prdUpdYn,
    required this.preSelPrc,
    required this.proxyYn,
    required this.rtngdDlvCst,
    required this.saleEndDate,
    required this.saleStartDate,
    required this.selLimitPersonType,
    required this.selMnbdNckNm,
    required this.selMthdCd,
    required this.selPrc,
    required this.selPrdClfCd,
    required this.selStatCd,
    required this.selTermUseYn,
    required this.sellerItemEventYn,
    required this.sellerPrdCd,
    required this.shopNo,
    required this.tmpltSeq,
    required this.validateMsg,
    required this.nResult,
    required this.dispCtgrNm,
    required this.dispCtgrNmMid,
    required this.dispCtgrNmRoot,
    required this.dscAmt,
    required this.dscPrice,
    required this.freeDelivery,
    required this.productOptionDetails,
    required this.dispCtgrNo1,
    required this.stock,
  });

  BndlDlvCnYn? bndlDlvCnYn;
  BndlDlvCnYn? cuponcheck;
  String? dispCtgrNo;
  String? dispCtgrStatCd;
  String? exchDlvCst;
  String? imageKindChk;
  String? optionAllAddPrc;
  BndlDlvCnYn? outsideYnIn;
  BndlDlvCnYn? outsideYnOut;
  String? prdAttrCd;
  String? prdNm;
  String? prdNo;
  String? prdSelQty;
  Yn? prdUpdYn;
  String? preSelPrc;
  BndlDlvCnYn? proxyYn;
  String? rtngdDlvCst;
  SaleEndDate? saleEndDate;
  String? saleStartDate;
  String? selLimitPersonType;
  String? selMnbdNckNm;
  String? selMthdCd;
  String? selPrc;
  String? selPrdClfCd;
  String? selStatCd;
  Yn? selTermUseYn;
  BndlDlvCnYn? sellerItemEventYn;
  dynamic sellerPrdCd;
  String? shopNo;
  String? tmpltSeq;
  String? validateMsg;
  String? nResult;
  String? dispCtgrNm;
  String? dispCtgrNmMid;
  String? dispCtgrNmRoot;
  String? dscAmt;
  String? dscPrice;
  String? freeDelivery;
  dynamic productOptionDetails;
  String? dispCtgrNo1;
  String? stock;

  Product.cache({
    this.prdNo,
    this.prdNm,
    this.dispCtgrNm,
    this.prdSelQty,
    this.selPrc,
  });
}
