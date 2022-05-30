import 'package:elevenia_jubelio/domain/entities/product.dart';

class ProductModel {
  ProductModel({
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

  final BndlDlvCnYn? bndlDlvCnYn;
  final BndlDlvCnYn? cuponcheck;
  final String? dispCtgrNo;
  final String? dispCtgrStatCd;
  final String? exchDlvCst;
  final String? imageKindChk;
  final String? optionAllAddPrc;
  final BndlDlvCnYn? outsideYnIn;
  final BndlDlvCnYn? outsideYnOut;
  final String? prdAttrCd;
  final String? prdNm;
  final String? prdNo;
  final String? prdSelQty;
  final Yn? prdUpdYn;
  final String? preSelPrc;
  final BndlDlvCnYn? proxyYn;
  final String? rtngdDlvCst;
  final SaleEndDate? saleEndDate;
  final String? saleStartDate;
  final String? selLimitPersonType;
  final String? selMnbdNckNm;
  final String? selMthdCd;
  final String? selPrc;
  final String? selPrdClfCd;
  final String? selStatCd;
  final Yn? selTermUseYn;
  final BndlDlvCnYn? sellerItemEventYn;
  final dynamic sellerPrdCd;
  final String? shopNo;
  final String? tmpltSeq;
  final String? validateMsg;
  final String? nResult;
  final String? dispCtgrNm;
  final String? dispCtgrNmMid;
  final String? dispCtgrNmRoot;
  final String? dscAmt;
  final String? dscPrice;
  final String? freeDelivery;
  final dynamic productOptionDetails;
  final String? dispCtgrNo1;
  final String? stock;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        bndlDlvCnYn: bndlDlvCnYnValues.map[json["bndlDlvCnYn"]],
        cuponcheck: bndlDlvCnYnValues.map[json["cuponcheck"]],
        dispCtgrNo: json["dispCtgrNo"],
        dispCtgrStatCd: json["dispCtgrStatCd"],
        exchDlvCst: json["exchDlvCst"],
        imageKindChk: json["imageKindChk"],
        optionAllAddPrc: json["optionAllAddPrc"],
        outsideYnIn: bndlDlvCnYnValues.map[json["outsideYnIn"]],
        outsideYnOut: bndlDlvCnYnValues.map[json["outsideYnOut"]],
        prdAttrCd: json["prdAttrCd"],
        prdNm: json["prdNm"],
        prdNo: json["prdNo"],
        prdSelQty: json["prdSelQty"],
        prdUpdYn: ynValues.map[json["prdUpdYN"]],
        preSelPrc: json["preSelPrc"],
        proxyYn: bndlDlvCnYnValues.map[json["proxyYn"]],
        rtngdDlvCst: json["rtngdDlvCst"],
        saleEndDate: saleEndDateValues.map[json["saleEndDate"]],
        saleStartDate: json["saleStartDate"],
        selLimitPersonType: json["selLimitPersonType"],
        selMnbdNckNm: json["selMnbdNckNm"],
        selMthdCd: json["selMthdCd"],
        selPrc: json["selPrc"],
        selPrdClfCd: json["selPrdClfCd"],
        selStatCd: json["selStatCd"],
        selTermUseYn: ynValues.map[json["selTermUseYn"]],
        sellerItemEventYn: bndlDlvCnYnValues.map[json["sellerItemEventYn"]],
        sellerPrdCd: json["sellerPrdCd"],
        shopNo: json["shopNo"],
        tmpltSeq: json["tmpltSeq"],
        validateMsg: json["validateMsg"],
        nResult: json["nResult"],
        dispCtgrNm: json["dispCtgrNm"],
        dispCtgrNmMid: json["dispCtgrNmMid"],
        dispCtgrNmRoot: json["dispCtgrNmRoot"],
        dscAmt: json["dscAmt"],
        dscPrice: json["dscPrice"],
        freeDelivery: json["freeDelivery"],
        productOptionDetails: json["ProductOptionDetails"],
        dispCtgrNo1: json["dispCtgrNo1"],
        stock: json["stock"],
      );

  Map<String, dynamic> toJson() => {
        "bndlDlvCnYn": bndlDlvCnYnValues.reverse![bndlDlvCnYn],
        "cuponcheck": bndlDlvCnYnValues.reverse![cuponcheck],
        "dispCtgrNo": dispCtgrNo,
        "dispCtgrStatCd": dispCtgrStatCd,
        "exchDlvCst": exchDlvCst,
        "imageKindChk": imageKindChk,
        "optionAllAddPrc": optionAllAddPrc,
        "outsideYnIn": bndlDlvCnYnValues.reverse![outsideYnIn],
        "outsideYnOut": bndlDlvCnYnValues.reverse![outsideYnOut],
        "prdAttrCd": prdAttrCd,
        "prdNm": prdNm,
        "prdNo": prdNo,
        "prdSelQty": prdSelQty,
        "prdUpdYN": ynValues.reverse![prdUpdYn],
        "preSelPrc": preSelPrc,
        "proxyYn": bndlDlvCnYnValues.reverse![proxyYn],
        "rtngdDlvCst": rtngdDlvCst,
        "saleEndDate": saleEndDateValues.reverse![saleEndDate],
        "saleStartDate": saleStartDate,
        "selLimitPersonType": selLimitPersonType,
        "selMnbdNckNm": selMnbdNckNm,
        "selMthdCd": selMthdCd,
        "selPrc": selPrc,
        "selPrdClfCd": selPrdClfCd,
        "selStatCd": selStatCd,
        "selTermUseYn": ynValues.reverse![selTermUseYn],
        "sellerItemEventYn": bndlDlvCnYnValues.reverse![sellerItemEventYn],
        "sellerPrdCd": sellerPrdCd,
        "shopNo": shopNo,
        "tmpltSeq": tmpltSeq,
        "validateMsg": validateMsg,
        "nResult": nResult,
        "dispCtgrNm": dispCtgrNm,
        "dispCtgrNmMid": dispCtgrNmMid,
        "dispCtgrNmRoot": dispCtgrNmRoot,
        "dscAmt": dscAmt,
        "dscPrice": dscPrice,
        "freeDelivery": freeDelivery,
        "ProductOptionDetails": productOptionDetails,
        "dispCtgrNo1": dispCtgrNo1,
        "stock": stock,
      };

  Product toEntity() {
    return Product(
        bndlDlvCnYn: bndlDlvCnYn,
        cuponcheck: cuponcheck,
        dispCtgrNo: dispCtgrNo,
        dispCtgrStatCd: dispCtgrStatCd,
        exchDlvCst: exchDlvCst,
        imageKindChk: imageKindChk,
        optionAllAddPrc: optionAllAddPrc,
        outsideYnIn: outsideYnIn,
        outsideYnOut: outsideYnOut,
        prdAttrCd: prdAttrCd,
        prdNm: prdNm,
        prdNo: prdNo,
        prdSelQty: prdSelQty,
        prdUpdYn: prdUpdYn,
        preSelPrc: preSelPrc,
        proxyYn: proxyYn,
        rtngdDlvCst: rtngdDlvCst,
        saleEndDate: saleEndDate,
        saleStartDate: saleStartDate,
        selLimitPersonType: selLimitPersonType,
        selMnbdNckNm: selMnbdNckNm,
        selMthdCd: selMthdCd,
        selPrc: selPrc,
        selPrdClfCd: selPrdClfCd,
        selStatCd: selStatCd,
        selTermUseYn: selTermUseYn,
        sellerItemEventYn: sellerItemEventYn,
        sellerPrdCd: sellerPrdCd,
        shopNo: shopNo,
        tmpltSeq: tmpltSeq,
        validateMsg: validateMsg,
        nResult: nResult,
        dispCtgrNm: dispCtgrNm,
        dispCtgrNmMid: dispCtgrNmMid,
        dispCtgrNmRoot: dispCtgrNmRoot,
        dscAmt: dscAmt,
        dscPrice: dscPrice,
        freeDelivery: freeDelivery,
        productOptionDetails: productOptionDetails,
        dispCtgrNo1: dispCtgrNo1,
        stock: stock);
  }
}

enum BndlDlvCnYn { N }

final bndlDlvCnYnValues = EnumValues({"N": BndlDlvCnYn.N});

enum Yn { Y }

final ynValues = EnumValues({"Y": Yn.Y});

class ProductOptionDetail {
  ProductOptionDetail({
    required this.addPrc,
    required this.colCount,
    required this.colOptPrice,
    required this.colValue0,
    required this.optWght,
    required this.selQty,
    required this.sellerPrdOptCd,
    required this.stckQty,
    required this.stockNo,
    required this.useYn,
  });

  final int addPrc;
  final int colCount;
  final int colOptPrice;
  final String? colValue0;
  final int optWght;
  final int selQty;
  final String? sellerPrdOptCd;
  final int stckQty;
  final int stockNo;
  final Yn? useYn;

  factory ProductOptionDetail.fromJson(Map<String?, dynamic> json) =>
      ProductOptionDetail(
        addPrc: json["addPrc"],
        colCount: json["colCount"],
        colOptPrice: json["colOptPrice"],
        colValue0: json["colValue0"],
        optWght: json["optWght"],
        selQty: json["selQty"],
        sellerPrdOptCd: json["sellerPrdOptCd"],
        stckQty: json["stckQty"],
        stockNo: json["stockNo"],
        useYn: ynValues.map[json["useYn"]],
      );

  Map<String?, dynamic> toJson() => {
        "addPrc": addPrc,
        "colCount": colCount,
        "colOptPrice": colOptPrice,
        "colValue0": colValue0,
        "optWght": optWght,
        "selQty": selQty,
        "sellerPrdOptCd": sellerPrdOptCd,
        "stckQty": stckQty,
        "stockNo": stockNo,
        "useYn": ynValues.reverse![useYn],
      };
}

enum SaleEndDate { th31122999 }

final saleEndDateValues = EnumValues({"31/12/2999": SaleEndDate.th31122999});

class EnumValues<T> {
  Map<String?, T> map;
  Map<T, String?>? reverseMap;

  EnumValues(this.map);

  Map<T, String?>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
