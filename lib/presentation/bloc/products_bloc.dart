import 'package:elevenia_jubelio/domain/usecases/get_products.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/utils/network_info.dart';
import '../../domain/entities/product.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProducts getProducts;
  final NetworkInfo networkInfo;

  int page = 1;

  ProductsBloc({required this.getProducts, required this.networkInfo})
      : super(ProductsInitial()) {
    on<GetProductsEvent>((event, emit) async {
      if (await networkInfo.isConnected) {
        if (state is ProductsLoading) return;

        final currentState = state;
        var oldListData = <Product>[];

        if (currentState is ProductsHasData) {
          oldListData = currentState.result;
        }

        emit(ProductsLoading(result: oldListData, isFirstFetch: page == 1));

        final result = await getProducts.execute(page);

        result.fold((failure) {
          emit(ProductsError(failure.message));
        }, (data) {
          if (data.isNotEmpty) {
            page++;
          }
          final listData = (state as ProductsLoading).result;
          listData.addAll(data);
          emit(ProductsHasData(result: listData));
        });
      } else {
        final result = await getProducts.execute(page);

        result.fold((failure) {
          emit(ProductsError(failure.message));
        }, (data) {
          emit(ProductsHasData(result: data));
        });
      }
    });
  }
}
