import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/models/product_model.dart';
import 'package:product_app/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  List<Product> _allProducts = [];

  ProductBloc(this.productRepository) : super(ProductLoading()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        _allProducts = await productRepository.fetchProducts();
        emit(ProductLoaded(_allProducts));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<LoadMoreProducts>((event, emit) async {
      try {
        if (state is ProductLoaded) {
          final currentProducts = (state as ProductLoaded).products;

          final newProducts = await productRepository.fetchProducts(limit: 10, skip: currentProducts.length);

          final uniqueNewProducts = newProducts.where((newProduct) {
            return !currentProducts.any((currentProduct) => currentProduct.id == newProduct.id);
          }).toList();

          emit(ProductLoaded(currentProducts + uniqueNewProducts));
        }
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<FilterProductsByCategory>((event, emit) {
      final currentState = state;
      if (currentState is ProductLoaded) {
        final filteredProducts = currentState.products.where((product) => product.category == event.category).toList();
        emit(ProductLoaded(filteredProducts));
      }
    });

    on<SortProductsByPrice>((event, emit) {
      final currentState = state;
      if (currentState is ProductLoaded) {
        final sortedProducts = List<Product>.from(currentState.products)
          ..sort((a, b) => event.ascending ? a.price.compareTo(b.price) : b.price.compareTo(a.price));
        emit(ProductLoaded(sortedProducts));
      }
    });

    on<SortProductsByRating>((event, emit) {
      final currentState = state;
      if (currentState is ProductLoaded) {
        final sortedProducts = List<Product>.from(currentState.products)
          ..sort((a, b) => event.ascending ? a.rating.compareTo(b.rating) : b.rating.compareTo(a.rating));
        emit(ProductLoaded(sortedProducts));
      }
    });

    on<SearchProducts>((event, emit) {
      final currentState = state;
      if (currentState is ProductLoaded) {
        if (event.query.isEmpty) {
          emit(ProductLoaded(_allProducts));
        } else {
          final filteredProducts = currentState.products
              .where((product) => product.title.toLowerCase().contains(event.query.toLowerCase()))
              .toList();
          emit(ProductLoaded(filteredProducts));
        }
      }
    });
  }
}
