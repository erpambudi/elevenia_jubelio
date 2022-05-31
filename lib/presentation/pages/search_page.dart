import 'package:elevenia_jubelio/domain/entities/product.dart';
import 'package:elevenia_jubelio/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../common/styles/colors.dart';

///Because the Search API is not provided,
///so here I use data products that have been loaded
class SearchPage extends StatefulWidget {
  final List<Product> productsLoaded;
  const SearchPage({Key? key, required this.productsLoaded}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> foundProducts = [];

  void _runFilter(String enteredKeyword) {
    List<Product> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.productsLoaded;
    } else {
      results = widget.productsLoaded
          .where((product) => product.prdNm!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundProducts = results;
    });
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        autofocus: true,
        style: const TextStyle(
          color: MyColor.blackTextColor,
        ),
        cursorColor: MyColor.primaryColor,
        decoration: const InputDecoration(
          hintText: 'Search Products',
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: MyColor.greyTextColor,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.all(14),
            child: SizedBox(
              width: 18,
              height: 18,
              child: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    foundProducts.addAll(widget.productsLoaded);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: 80,
        backgroundColor: MyColor.primaryColor,
        title: _searchBar(),
      ),
      body: (foundProducts.isNotEmpty)
          ? ListView.builder(
              itemBuilder: ((context, index) {
                return ProductCard(
                  product: foundProducts[index],
                );
              }),
              itemCount: foundProducts.length,
            )
          : const Center(
              child: Text(
                'No result found',
                style: TextStyle(
                  fontSize: 18,
                  color: MyColor.greyTextColor,
                ),
              ),
            ),
    );
  }
}
