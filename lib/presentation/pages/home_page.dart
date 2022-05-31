import 'package:elevenia_jubelio/common/utils/routes.dart';
import 'package:elevenia_jubelio/domain/entities/product.dart';
import 'package:elevenia_jubelio/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/styles/colors.dart';
import '../bloc/products_bloc.dart';
import '../widgets/state_handling.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();

  void _onScroll() {
    final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.position.pixels;
    if (currentScroll == maxScroll) {
      BlocProvider.of<ProductsBloc>(context).add(const GetProductsEvent());
    }
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: const Text(
        'Find Your Favorite Products',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
      child: Row(
        children: [
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    if (state is ProductsHasData) {
                      Navigator.of(context).pushNamed(Routes.searchPage,
                          arguments: state.result);
                    }
                  },
                  child: Container(
                    height: 50,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F3F7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.search,
                          color: MyColor.primaryColor,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Search Products',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            width: 14,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.cartPage);
            },
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.black54,
              size: 28,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }

  Widget _products() {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsInitial) {
          return StateHandling.onLoading();
        }

        if (state is ProductsError) {
          return StateHandling.onError(state.message);
        }

        if (state is ProductsLoading && state.isFirstFetch) {
          return StateHandling.onLoading();
        }

        List<Product> listData = [];
        bool isLoading = false;

        if (state is ProductsLoading) {
          listData = state.result;
          isLoading = true;
        } else if (state is ProductsHasData) {
          listData = state.result;
        }

        return SliverList(
          delegate: SliverChildListDelegate(
            List<Widget>.generate(
              listData.length + (isLoading ? 1 : 0),
              (index) {
                if (index < listData.length) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: listData[index] == listData.first ? 12 : 0),
                    child: ProductCard(product: listData[index]),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(14),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProductsBloc>().add(const GetProductsEvent(page: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(_onScroll);

    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            toolbarHeight: 70,
            elevation: 0,
            titleSpacing: 0,
            backgroundColor: MyColor.primaryColor,
            title: _header(),
            bottom: AppBar(
              elevation: 0,
              titleSpacing: 0,
              toolbarHeight: 80,
              backgroundColor: Colors.white,
              title: _searchBar(),
            ),
          ),
          _products(),
        ],
      ),
    );
  }
}
