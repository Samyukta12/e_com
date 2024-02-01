import 'package:e_com/model/cart_model.dart';

abstract class CartState{

}

class LoadingCartState extends CartState{

}
class LoadedCartState extends CartState{
  List<CartList> newcartlist = [];


  LoadedCartState(this.newcartlist);




}
class ErrorCartState extends CartState {
  final String message;

  ErrorCartState(this.message);
}