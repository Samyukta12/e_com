import 'package:e_com/model/item_model.dart';

abstract class CartAddEvent {}

class CartClickedEvent extends CartAddEvent {}

class CartNavigateEvent extends CartAddEvent {
  Items item;
  CartNavigateEvent({required this.item});
}
