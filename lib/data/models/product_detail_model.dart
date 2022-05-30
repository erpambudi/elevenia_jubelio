import 'package:elevenia_jubelio/domain/entities/product_detail.dart';

class ProductDetailModel {
  ProductDetailModel({
    required this.abrdBrandYn,
    required this.abrdCnDlvCst,
    required this.asDetail,
    required this.bcktExYn,
    required this.bndlDlvCnYn,
    required this.chinaSaleYn,
    required this.chinaSelPrc,
    required this.cupnDscMthdCd,
    required this.cuponcheck,
    required this.dispCtgrNo,
    required this.dispCtgrStatCd,
    required this.displayYn,
    required this.dlvBasiAmt,
    required this.dlvClf,
    required this.dlvCnAreaCd,
    required this.dlvCstInstBasiCd,
    required this.dlvCstPayTypCd,
    required this.dlvGrntYn,
    required this.dlvWyCd,
    required this.dscAmtPercnt,
    required this.exchDlvCst,
    required this.htmlDetail,
    required this.imageKindChk,
    required this.islandDlvCst,
    required this.jejuDlvCst,
    required this.memberNo,
    required this.minorSelCnYn,
    required this.mobile1WonYn,
    required this.mstrPrdNo,
    required this.optionAllAddPrc,
    required this.orgnTypCd,
    required this.outsideYnIn,
    required this.outsideYnOut,
    required this.paidSelPrc,
    required this.prcCmpExpYn,
    required this.prdAttrCd,
    required this.prdImage01,
    required this.prdNm,
    required this.prdNo,
    required this.prdSelQty,
    required this.prdStatCd,
    required this.prdTypCd,
    required this.prdUpdYn,
    required this.prdWght,
    required this.preSelPrc,
    required this.proxyYn,
    required this.reviewDispYn,
    required this.reviewOptDispYn,
    required this.rtngExchDetail,
    required this.rtngdDlvCst,
    required this.selLimitPersonType,
    required this.selLimitQty,
    required this.selLimitTypCd,
    required this.selMinLimitQty,
    required this.selMinLimitTypCd,
    required this.selMnbdNckNm,
    required this.selMthdCd,
    required this.selPrc,
    required this.selPrdClfCd,
    required this.selStatCd,
    required this.selStatNm,
    required this.selTermUseYn,
    required this.sellerItemEventYn,
    required this.sellerPrdCd,
    required this.shopNo,
    required this.suplDtyfrPrdClfCd,
    required this.tmpltSeq,
    required this.useGiftYn,
    required this.useMon,
    required this.validateMsg,
    required this.nResult,
    required this.createDt,
    required this.dispCtgrNm,
    required this.dispCtgrNmMid,
    required this.dispCtgrNmRoot,
    required this.dscAmt,
    required this.dscPrice,
    required this.freeDelivery,
    required this.dispCtgrNo2,
    required this.dispCtgrNo1,
    required this.stock,
    required this.updateDt,
  });

  final String? abrdBrandYn;
  final String? abrdCnDlvCst;
  final String? asDetail;
  final String? bcktExYn;
  final String? bndlDlvCnYn;
  final String? chinaSaleYn;
  final String? chinaSelPrc;
  final String? cupnDscMthdCd;
  final String? cuponcheck;
  final String? dispCtgrNo;
  final String? dispCtgrStatCd;
  final String? displayYn;
  final String? dlvBasiAmt;
  final String? dlvClf;
  final String? dlvCnAreaCd;
  final String? dlvCstInstBasiCd;
  final String? dlvCstPayTypCd;
  final String? dlvGrntYn;
  final String? dlvWyCd;
  final String? dscAmtPercnt;
  final String? exchDlvCst;
  final String? htmlDetail;
  final String? imageKindChk;
  final String? islandDlvCst;
  final String? jejuDlvCst;
  final String? memberNo;
  final String? minorSelCnYn;
  final String? mobile1WonYn;
  final String? mstrPrdNo;
  final String? optionAllAddPrc;
  final String? orgnTypCd;
  final String? outsideYnIn;
  final String? outsideYnOut;
  final String? paidSelPrc;
  final String? prcCmpExpYn;
  final String? prdAttrCd;
  final String? prdImage01;
  final String? prdNm;
  final String? prdNo;
  final String? prdSelQty;
  final String? prdStatCd;
  final String? prdTypCd;
  final String? prdUpdYn;
  final String? prdWght;
  final String? preSelPrc;
  final String? proxyYn;
  final String? reviewDispYn;
  final String? reviewOptDispYn;
  final String? rtngExchDetail;
  final String? rtngdDlvCst;
  final String? selLimitPersonType;
  final String? selLimitQty;
  final String? selLimitTypCd;
  final String? selMinLimitQty;
  final String? selMinLimitTypCd;
  final String? selMnbdNckNm;
  final String? selMthdCd;
  final String? selPrc;
  final String? selPrdClfCd;
  final String? selStatCd;
  final String? selStatNm;
  final String? selTermUseYn;
  final String? sellerItemEventYn;
  final String? sellerPrdCd;
  final String? shopNo;
  final String? suplDtyfrPrdClfCd;
  final String? tmpltSeq;
  final String? useGiftYn;
  final String? useMon;
  final String? validateMsg;
  final String? nResult;
  final DateTime createDt;
  final String? dispCtgrNm;
  final String? dispCtgrNmMid;
  final String? dispCtgrNmRoot;
  final String? dscAmt;
  final String? dscPrice;
  final String? freeDelivery;
  final String? dispCtgrNo2;
  final String? dispCtgrNo1;
  final String? stock;
  final DateTime updateDt;

  factory ProductDetailModel.fromJson(Map<String?, dynamic> json) =>
      ProductDetailModel(
        abrdBrandYn: json["abrdBrandYn"],
        abrdCnDlvCst: json["abrdCnDlvCst"],
        asDetail: json["asDetail"],
        bcktExYn: json["bcktExYn"],
        bndlDlvCnYn: json["bndlDlvCnYn"],
        chinaSaleYn: json["chinaSaleYn"],
        chinaSelPrc: json["chinaSelPrc"],
        cupnDscMthdCd: json["cupnDscMthdCd"],
        cuponcheck: json["cuponcheck"],
        dispCtgrNo: json["dispCtgrNo"],
        dispCtgrStatCd: json["dispCtgrStatCd"],
        displayYn: json["displayYn"],
        dlvBasiAmt: json["dlvBasiAmt"],
        dlvClf: json["dlvClf"],
        dlvCnAreaCd: json["dlvCnAreaCd"],
        dlvCstInstBasiCd: json["dlvCstInstBasiCd"],
        dlvCstPayTypCd: json["dlvCstPayTypCd"],
        dlvGrntYn: json["dlvGrntYn"],
        dlvWyCd: json["dlvWyCd"],
        dscAmtPercnt: json["dscAmtPercnt"],
        exchDlvCst: json["exchDlvCst"],
        htmlDetail: json["htmlDetail"],
        imageKindChk: json["imageKindChk"],
        islandDlvCst: json["islandDlvCst"],
        jejuDlvCst: json["jejuDlvCst"],
        memberNo: json["memberNo"],
        minorSelCnYn: json["minorSelCnYn"],
        mobile1WonYn: json["mobile1WonYn"],
        mstrPrdNo: json["mstrPrdNo"],
        optionAllAddPrc: json["optionAllAddPrc"],
        orgnTypCd: json["orgnTypCd"],
        outsideYnIn: json["outsideYnIn"],
        outsideYnOut: json["outsideYnOut"],
        paidSelPrc: json["paidSelPrc"],
        prcCmpExpYn: json["prcCmpExpYn"],
        prdAttrCd: json["prdAttrCd"],
        prdImage01: json["prdImage01"],
        prdNm: json["prdNm"],
        prdNo: json["prdNo"],
        prdSelQty: json["prdSelQty"],
        prdStatCd: json["prdStatCd"],
        prdTypCd: json["prdTypCd"],
        prdUpdYn: json["prdUpdYN"],
        prdWght: json["prdWght"],
        preSelPrc: json["preSelPrc"],
        proxyYn: json["proxyYn"],
        reviewDispYn: json["reviewDispYn"],
        reviewOptDispYn: json["reviewOptDispYn"],
        rtngExchDetail: json["rtngExchDetail"],
        rtngdDlvCst: json["rtngdDlvCst"],
        selLimitPersonType: json["selLimitPersonType"],
        selLimitQty: json["selLimitQty"],
        selLimitTypCd: json["selLimitTypCd"],
        selMinLimitQty: json["selMinLimitQty"],
        selMinLimitTypCd: json["selMinLimitTypCd"],
        selMnbdNckNm: json["selMnbdNckNm"],
        selMthdCd: json["selMthdCd"],
        selPrc: json["selPrc"],
        selPrdClfCd: json["selPrdClfCd"],
        selStatCd: json["selStatCd"],
        selStatNm: json["selStatNm"],
        selTermUseYn: json["selTermUseYn"],
        sellerItemEventYn: json["sellerItemEventYn"],
        sellerPrdCd: json["sellerPrdCd"],
        shopNo: json["shopNo"],
        suplDtyfrPrdClfCd: json["suplDtyfrPrdClfCd"],
        tmpltSeq: json["tmpltSeq"],
        useGiftYn: json["useGiftYn"],
        useMon: json["useMon"],
        validateMsg: json["validateMsg"],
        nResult: json["nResult"],
        createDt: DateTime.parse(json["createDt"]),
        dispCtgrNm: json["dispCtgrNm"],
        dispCtgrNmMid: json["dispCtgrNmMid"],
        dispCtgrNmRoot: json["dispCtgrNmRoot"],
        dscAmt: json["dscAmt"],
        dscPrice: json["dscPrice"],
        freeDelivery: json["freeDelivery"],
        dispCtgrNo2: json["dispCtgrNo2"],
        dispCtgrNo1: json["dispCtgrNo1"],
        stock: json["stock"],
        updateDt: DateTime.parse(json["updateDt"]),
      );

  ProductDetail toEntity() {
    return ProductDetail(
        abrdBrandYn: abrdBrandYn,
        abrdCnDlvCst: abrdCnDlvCst,
        asDetail: asDetail,
        bcktExYn: bcktExYn,
        bndlDlvCnYn: bndlDlvCnYn,
        chinaSaleYn: chinaSaleYn,
        chinaSelPrc: chinaSelPrc,
        cupnDscMthdCd: cupnDscMthdCd,
        cuponcheck: cuponcheck,
        dispCtgrNo: dispCtgrNo,
        dispCtgrStatCd: dispCtgrStatCd,
        displayYn: displayYn,
        dlvBasiAmt: dlvBasiAmt,
        dlvClf: dlvClf,
        dlvCnAreaCd: dlvCnAreaCd,
        dlvCstInstBasiCd: dlvCstInstBasiCd,
        dlvCstPayTypCd: dlvCstPayTypCd,
        dlvGrntYn: dlvGrntYn,
        dlvWyCd: dlvWyCd,
        dscAmtPercnt: dscAmtPercnt,
        exchDlvCst: exchDlvCst,
        htmlDetail: htmlDetail,
        imageKindChk: imageKindChk,
        islandDlvCst: islandDlvCst,
        jejuDlvCst: jejuDlvCst,
        memberNo: memberNo,
        minorSelCnYn: minorSelCnYn,
        mobile1WonYn: mobile1WonYn,
        mstrPrdNo: mstrPrdNo,
        optionAllAddPrc: optionAllAddPrc,
        orgnTypCd: orgnTypCd,
        outsideYnIn: outsideYnIn,
        outsideYnOut: outsideYnOut,
        paidSelPrc: paidSelPrc,
        prcCmpExpYn: prcCmpExpYn,
        prdAttrCd: prdAttrCd,
        prdImage01: prdImage01,
        prdNm: prdNm,
        prdNo: prdNo,
        prdSelQty: prdSelQty,
        prdStatCd: prdStatCd,
        prdTypCd: prdTypCd,
        prdUpdYn: prdUpdYn,
        prdWght: prdWght,
        preSelPrc: preSelPrc,
        proxyYn: proxyYn,
        reviewDispYn: reviewDispYn,
        reviewOptDispYn: reviewOptDispYn,
        rtngExchDetail: rtngExchDetail,
        rtngdDlvCst: rtngdDlvCst,
        selLimitPersonType: selLimitPersonType,
        selLimitQty: selLimitQty,
        selLimitTypCd: selLimitTypCd,
        selMinLimitQty: selMinLimitQty,
        selMinLimitTypCd: selMinLimitTypCd,
        selMnbdNckNm: selMnbdNckNm,
        selMthdCd: selMthdCd,
        selPrc: selPrc,
        selPrdClfCd: selPrdClfCd,
        selStatCd: selStatCd,
        selStatNm: selStatNm,
        selTermUseYn: selTermUseYn,
        sellerItemEventYn: sellerItemEventYn,
        sellerPrdCd: sellerPrdCd,
        shopNo: shopNo,
        suplDtyfrPrdClfCd: suplDtyfrPrdClfCd,
        tmpltSeq: tmpltSeq,
        useGiftYn: useGiftYn,
        useMon: useMon,
        validateMsg: validateMsg,
        nResult: nResult,
        createDt: createDt,
        dispCtgrNm: dispCtgrNm,
        dispCtgrNmMid: dispCtgrNmMid,
        dispCtgrNmRoot: dispCtgrNmRoot,
        dscAmt: dscAmt,
        dscPrice: dscPrice,
        freeDelivery: freeDelivery,
        dispCtgrNo2: dispCtgrNo2,
        dispCtgrNo1: dispCtgrNo1,
        stock: stock,
        updateDt: updateDt);
  }
}
