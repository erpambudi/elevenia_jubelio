import 'package:elevenia_jubelio/domain/entities/product_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_detail_product.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetDetailProduct getDetailProduct;

  ProductDetailBloc({required this.getDetailProduct})
      : super(ProductDetailInitial()) {
    on<GetDetailProductEvent>((event, emit) async {
      emit(ProductDetailLoading());

      final result = await getDetailProduct.execute(event.id);

      result.fold((failure) {
        emit(ProductDetailError(failure.message));
      }, (data) {
        emit(ProductDetailHasData(product: data));
      });
    });
  }
}
