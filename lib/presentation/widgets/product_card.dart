import 'package:elevenia_jubelio/domain/entities/product.dart';
import 'package:elevenia_jubelio/presentation/bloc/product_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../common/styles/colors.dart';
import '../../common/utils/routes.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<ProductDetailBloc>()
            .add(GetDetailProductEvent(product.prdNo!));
        Navigator.of(context).pushNamed(Routes.productdetailPage);
      },
      child: Container(
        height: 140,
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                'assets/images/image_elevenia_logo.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.prdNm ?? '-',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: MyColor.blackTextColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        'Category : ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: MyColor.greyTextColor,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          product.dispCtgrNm ?? '-',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: MyColor.blackTextColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        'Stock : ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: MyColor.greyTextColor,
                        ),
                      ),
                      Text(
                        product.prdSelQty ?? '-',
                        style: const TextStyle(
                          fontSize: 12,
                          color: MyColor.blackTextColor,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        'Price : ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: MyColor.primaryColor,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: "id-ID",
                          symbol: "Rp ",
                          decimalDigits: 0,
                        ).format(int.parse(product.selPrc ?? '0')),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: MyColor.primaryColor,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
