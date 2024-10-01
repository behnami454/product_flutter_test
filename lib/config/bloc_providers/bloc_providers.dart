import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/blocs/cart/cart_bloc.dart';
import 'package:product_app/blocs/product/product_bloc.dart';
import 'package:product_app/repositories/product_repository.dart';
import 'package:product_app/services/api_service.dart';

class AppBlocProvider extends StatelessWidget {
  final Widget child;

  const AppBlocProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductRepository productRepository = ProductRepository(apiService: APIService());

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(productRepository)..add(LoadProducts()),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
      ],
      child: child,
    );
  }
}
