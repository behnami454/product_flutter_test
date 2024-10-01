import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<Product> cartItems = [];

  CartBloc() : super(CartInitial()) {
    on<LoadCart>((event, emit) {
      emit(CartUpdated(cartItems));
    });

    on<AddToCart>((event, emit) {
      cartItems.add(event.product);
      emit(CartUpdated(cartItems));
    });

    on<RemoveFromCart>((event, emit) {
      cartItems.remove(event.product);
      emit(CartUpdated(cartItems));
    });
  }
}
