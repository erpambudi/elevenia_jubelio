import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../common/styles/colors.dart';
import '../../domain/entities/cart.dart';
import '../bloc/cart_bloc.dart';

class ProductCartCard extends StatefulWidget {
  final Cart cart;
  const ProductCartCard({Key? key, required this.cart}) : super(key: key);

  @override
  State<ProductCartCard> createState() => _ProductCartCardState();
}

class _ProductCartCardState extends State<ProductCartCard> {
  int? quantity;

  _onAddQuantity() {
    context.read<CartBloc>().add(AddQuantityProductEvent(widget.cart));
    context.read<CartBloc>().add(GetCartsEvent());
  }

  _onReduceQuantity() {
    if (quantity != 1) {
      context.read<CartBloc>().add(ReduceQuantityProductEvent(widget.cart));
      context.read<CartBloc>().add(GetCartsEvent());
    } else {
      _onRemoveItem();
    }
  }

  _onRemoveItem() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Remove ${widget.cart.prdNm}',
            style: const TextStyle(
              color: MyColor.primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          content: Text(
              'Are you sure you want to remove ${widget.cart.prdNm} from cart?'),
          actions: [
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: MyColor.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Remove',
                style: TextStyle(
                  color: MyColor.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                context
                    .read<CartBloc>()
                    .add(RemoveCartProductEvent(widget.cart));
                context.read<CartBloc>().add(GetCartsEvent());
              },
            ),
          ],
        );
      },
    );
  }

  Widget _quantityBox() {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartStateLoaded) {
          quantity = state.carts
              .firstWhere((cart) => cart.prdNo == widget.cart.prdNo)
              .quantity;
        }
        return Text(
          (quantity != null) ? '$quantity' : '-',
          style: const TextStyle(
            color: MyColor.blackTextColor,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.cart.prdNm ?? '-',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColor.blackTextColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ),
              IconButton(
                onPressed: _onRemoveItem,
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 21,
          ),
          Row(
            children: [
              Container(
                height: 58,
                width: 58,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.2,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/image_elevenia_logo.png',
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        NumberFormat.currency(
                          locale: "id-ID",
                          symbol: "Rp ",
                          decimalDigits: 0,
                        ).format(int.parse(widget.cart.selPrc ?? '0')),
                        style: const TextStyle(
                          color: MyColor.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 3,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: _onReduceQuantity,
                          child: Container(
                            width: 30,
                            height: 24,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF5BB98B),
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '-',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        _quantityBox(),
                        const SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: _onAddQuantity,
                          child: Container(
                            width: 30,
                            height: 24,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF5BB98B),
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '+',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
