import 'package:bloc/bloc.dart';
import 'package:e_com/model/item_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void functionname() {
    // emit(CartSuccess(items))
  }
}
