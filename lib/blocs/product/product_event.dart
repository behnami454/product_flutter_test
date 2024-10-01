part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {}

class FilterProductsByCategory extends ProductEvent {
  final String category;

  const FilterProductsByCategory(this.category);

  @override
  List<Object> get props => [category];
}

class SortProductsByPrice extends ProductEvent {
  final bool ascending;

  const SortProductsByPrice(this.ascending);

  @override
  List<Object> get props => [ascending];
}

class SortProductsByRating extends ProductEvent {
  final bool ascending;

  const SortProductsByRating(this.ascending);

  @override
  List<Object> get props => [ascending];
}

class SearchProducts extends ProductEvent {
  final String query;

  const SearchProducts(this.query);

  @override
  List<Object> get props => [query];
}

class LoadMoreProducts extends ProductEvent {
  final int page;

  const LoadMoreProducts({required this.page});

  @override
  List<Object> get props => [page];
}
