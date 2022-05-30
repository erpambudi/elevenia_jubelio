import 'package:elevenia_jubelio/presentation/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../injection.dart' as di;

import 'common/styles/theme.dart';
import 'common/utils/routes.dart';
import 'presentation/bloc/cart_bloc.dart';
import 'presentation/bloc/product_detail_bloc.dart';
import 'presentation/bloc/products_bloc.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/product_detail_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<ProductsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ProductDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<CartBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: MyTheme.light(),
        initialRoute: Routes.homePage,
        routes: {
          Routes.homePage: (context) => const HomePage(),
          Routes.productdetailPage: (context) => const ProductDetailPage(),
          Routes.cartPage: (context) => const CartPage(),
        },
      ),
    );
  }
}
