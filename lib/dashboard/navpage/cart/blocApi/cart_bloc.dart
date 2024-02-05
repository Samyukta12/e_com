import 'dart:convert';

import 'package:e_com/dashboard/navpage/cart/blocApi/cart_event.dart';
import 'package:e_com/dashboard/navpage/cart/blocApi/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../../model/cart_model.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(LoadingCartState()) {
    on<CartEvent>((event, emit) => cartEvent(event, emit));
  }

  void cartEvent(CartEvent event, Emitter<CartState> emit) async {
    try {
      final response =
          await http.get(Uri.parse("https://fakestoreapi.com/carts"));
      if (response.statusCode == 200) {
        // List<CartList> cartList = [];
        var data = jsonDecode(response.body.toString());

        // for (Map<String, dynamic> cartData in data) {
        //   CartList cartItem = CartList.fromJson(cartData);
        //   cartList.add(cartItem);

        // }
        List<CartList> cartList =
            List.from(data).map((e) => CartList.fromJson(e)).toList();

        emit(LoadedCartState(cartList));
      } else {
        emit(ErrorCartState("Failed to load data"));
      }
    } catch (e) {
      emit(ErrorCartState("Failed to load data"));
    }
  }
}
