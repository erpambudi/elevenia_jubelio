part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCartsEvent extends CartEvent {}

class SaveCartProductEvent extends CartEvent {
  final ProductDetail product;

  const SaveCartProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

class AddQuantityProductEvent extends CartEvent {
  final Cart cart;

  const AddQuantityProductEvent(this.cart);

  @override
  List<Object> get props => [cart];
}

class ReduceQuantityProductEvent extends CartEvent {
  final Cart cart;

  const ReduceQuantityProductEvent(this.cart);

  @override
  List<Object> get props => [cart];
}

class RemoveCartProductEvent extends CartEvent {
  final Cart cart;

  const RemoveCartProductEvent(this.cart);

  @override
  List<Object> get props => [cart];
}
