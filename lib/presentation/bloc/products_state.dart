part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {
  final List<Product> result;
  final bool isFirstFetch;

  const ProductsLoading({required this.result, this.isFirstFetch = false});

  @override
  List<Object> get props => [result, isFirstFetch];
}

class ProductsNoData extends ProductsState {
  final String message;

  const ProductsNoData(this.message);

  @override
  List<Object> get props => [message];
}

class ProductsHasData extends ProductsState {
  final List<Product> result;

  const ProductsHasData({
    required this.result,
  });

  @override
  List<Object> get props => [result];
}

class ProductsError extends ProductsState {
  final String message;

  const ProductsError(this.message);

  @override
  List<Object> get props => [message];
}
