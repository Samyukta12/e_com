import '../model/item_model.dart';

abstract class HomeState {}

class InitialState extends HomeState {}

class loadingstate extends HomeState {}

class ResponseState extends HomeState {
  List<Items> newlist = [];

  ResponseState(this.newlist);
}
