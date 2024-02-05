// for build ui
import 'package:e_com/model/item_model.dart';

abstract class CartAddState {}

//for action
abstract class CartAddActionState {}

class LoadingCartNavigateState extends CartAddState {}

class SuccessCartNavigateState extends CartAddState {
  final List<Items> selectedItem;
  SuccessCartNavigateState(this.selectedItem);

  List<Object> get props => [selectedItem];
}

class ErrorCartNavigateActionState extends CartAddState {}

class ItemNavigateToCartState extends CartAddActionState {}
