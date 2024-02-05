import 'package:e_com/model/item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartAddBloc extends Cubit<List<Items>> {
  CartAddBloc() : super([]);

  addIntoCart(Items item) {
    state.add(item);
    emit(state);
  }

  // void cartNavigateEvent(CartNavigateEvent event, Emitter<CartAddState> emit) {
  //   List<Items> list = [event.item];
  //   if (event.item != null) {
  //     list.add(event.item);
  //   }

  //   emit(SuccessCartNavigateState(list));
}
