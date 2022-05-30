import 'dart:developer';

import 'package:elevenia_jubelio/domain/entities/product_detail.dart';
import 'package:elevenia_jubelio/domain/usecases/get_cart_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_detail_product.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetDetailProduct getDetailProduct;
  final GetCartStatus getCartStatus;

  ProductDetailBloc(
      {required this.getDetailProduct, required this.getCartStatus})
      : super(ProductDetailInitial()) {
    on<GetDetailProductEvent>((event, emit) async {
      emit(ProductDetailLoading());

      final result = await getDetailProduct.execute(event.id);

      await result.fold((failure) {
        emit(ProductDetailError(failure.message));
      }, (data) async {
        bool isAddedToCart = await getCartStatus.execute(data.prdNo!);
        log(isAddedToCart.toString());
        emit(ProductDetailHasData(product: data, isAddedToCart: isAddedToCart));
      });
    });
  }
}
