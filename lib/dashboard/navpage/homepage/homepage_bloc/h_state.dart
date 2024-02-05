import 'package:e_com/model/item_model.dart';

abstract class DescriptionState {}

class LoadingDescriptionState extends DescriptionState {}

class LoadedDescriptionState extends DescriptionState {
  final Items item;
  LoadedDescriptionState(this.item);

  List<Object> get props => [item];
}

class ErrorWishlistState extends DescriptionState {}
