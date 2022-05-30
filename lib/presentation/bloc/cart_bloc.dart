import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/cart.dart';
import '../../domain/entities/product_detail.dart';
import '../../domain/usecases/get_cart_products.dart';
import '../../domain/usecases/remove_cart_product.dart';
import '../../domain/usecases/save_cart_product.dart';
import '../../domain/usecases/update_cart_product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartProducts getCartProducts;
  final SaveCartProduct saveCartProduct;
  final RemoveCartProduct removeCartProduct;
  final UpdateCartProduct updateCartProduct;

  CartBloc(
      {required this.getCartProducts,
      required this.saveCartProduct,
      required this.removeCartProduct,
      required this.updateCartProduct})
      : super(CartStateInitial()) {
    on<GetCartsEvent>(_onGetCartsProduct);
    on<SaveCartProductEvent>(_onSaveProduct);
    on<AddQuantityProductEvent>(_onAddQuantityProduct);
    on<ReduceQuantityProductEvent>(_onReduceQuantityProduct);
    on<RemoveCartProductEvent>(_onRemoveProduct);
  }

  void _onGetCartsProduct(GetCartsEvent event, Emitter<CartState> emit) async {
    final result = await getCartProducts.execute();
    result.fold(
      (failure) {
        log(failure.message);
        emit(const CartStateError('Error while loading cart'));
      },
      (carts) {
        int totalPrice = 0;
        int totalItems = 0;

        for (final cart in carts) {
          totalPrice += int.parse(cart.selPrc!) * cart.quantity;
          totalItems += cart.quantity;
        }

        emit(CartStateLoaded(
            carts: carts, totalPrice: totalPrice, totalItems: totalItems));
      },
    );
  }

  void _onSaveProduct(
      SaveCartProductEvent event, Emitter<CartState> emit) async {
    final result = await saveCartProduct.execute(event.product);
    result.fold(
      (failure) {
        log(failure.message);
        emit(const CartStateError('Failed to save Product to cart'));
      },
      (data) {
        log(data);
      },
    );
  }

  void _onAddQuantityProduct(
      AddQuantityProductEvent event, Emitter<CartState> emit) async {
    int quantity = event.cart.quantity + 1;

    final result = await updateCartProduct.execute(event.cart, quantity);
    result.fold(
      (failure) {
        log(failure.message);
        emit(const CartStateError('Add quantity failed'));
      },
      (data) async {
        log(data);
      },
    );
  }

  void _onReduceQuantityProduct(
      ReduceQuantityProductEvent event, Emitter<CartState> emit) async {
    if (event.cart.quantity != 1) {
      int quantity = event.cart.quantity - 1;
      final result = await updateCartProduct.execute(event.cart, quantity);
      result.fold(
        (failure) {
          log(failure.message);
          emit(const CartStateError('Reduce quantity failed'));
        },
        (data) async {
          log(data);
        },
      );
    } else {
      log('Cannot reduce quantity');
    }
  }

  void _onRemoveProduct(
      RemoveCartProductEvent event, Emitter<CartState> emit) async {
    final result = await removeCartProduct.execute(event.cart);
    result.fold(
      (failure) {
        log(failure.message);
        emit(const CartStateError('Failed to remove Product from cart'));
      },
      (data) async {
        log(data);
      },
    );
  }
}
