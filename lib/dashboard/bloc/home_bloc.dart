import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../model/item_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitialState()) {
    on<InitialEvent>((event, emit) => initialEvent(event, emit));
  }
  List<Items> itemsList = [];
  void initialEvent(Object? event, Emitter<HomeState> emit) async {
    await http
        .get(Uri.parse("https://fakestoreapi.com/products"))
        .then((response) {
      // print(response.body);
      itemsList.addAll(itemsFromJson(response.body));
      emit(ResponseState(itemsList));
    });

    // ApiRequest apiRequest = ApiRequest();
    // String productApi = "https://fakestoreapi.com/products";
    //
    // try {
    //  var items = await apiRequest.getApi(productApi);
    //   print(items);
    //
    //   // emit(ResponseState(items));
    // } catch (e) {}
  }
}
