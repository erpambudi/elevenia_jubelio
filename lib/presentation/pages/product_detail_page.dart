import 'package:elevenia_jubelio/common/styles/colors.dart';
import 'package:elevenia_jubelio/common/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../bloc/cart_bloc.dart';
import '../bloc/product_detail_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            const Text(
              'Product Detail',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).popAndPushNamed(Routes.cartPage);
              },
              child: const SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _imageNotFoundView() {
      return Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            'Image not found',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    Widget _imageProduct(String? imageUrl) {
      return Container(
        height: 300,
        margin: const EdgeInsets.symmetric(horizontal: 18),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/image_loading.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: imageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _imageNotFoundView();
                  },
                ),
              )
            : _imageNotFoundView(),
      );
    }

    Widget _productDetail(ProductDetailHasData state) {
      return Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.product.prdNm ?? '-',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: MyColor.blackTextColor,
                    ),
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
                        state.product.prdSelQty ?? '-',
                        style: const TextStyle(
                          fontSize: 12,
                          color: MyColor.blackTextColor,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    NumberFormat.currency(
                      locale: "id-ID",
                      symbol: "Rp ",
                      decimalDigits: 0,
                    ).format(int.parse(state.product.selPrc ?? '0')),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: MyColor.primaryColor,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: HtmlWidget(
                state.product.htmlDetail ?? '-',
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              color: Colors.white,
              child: ElevatedButton(
                onPressed: () {
                  if (state.isAddedToCart) {
                    Fluttertoast.showToast(
                      msg: 'Product already added in cart',
                      backgroundColor: Colors.green,
                    );
                  } else if (state.product.prdSelQty == '0') {
                    Fluttertoast.showToast(
                      msg: "Stock is empty",
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                  } else {
                    context
                        .read<CartBloc>()
                        .add(SaveCartProductEvent(state.product));
                    context
                        .read<ProductDetailBloc>()
                        .add(GetDetailProductEvent(state.product.prdNo!));
                    Fluttertoast.showToast(
                      msg: 'Added to cart',
                      backgroundColor: Colors.green,
                    );
                  }
                },
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductDetailHasData) {
            return ListView(
              children: [
                _header(),
                _imageProduct(state.product.prdImage01),
                _productDetail(state),
              ],
            );
          } else if (state is ProductDetailError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text('unknown'),
            );
          }
        },
      ),
    );
  }
}
