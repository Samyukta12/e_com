import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:e_com/model/item_model.dart';
import 'package:e_com/navpage/homepage/homepage_bloc/h_event.dart';
import 'package:e_com/navpage/homepage/homepage_bloc/h_state.dart';
import 'package:http/http.dart' as http;

class SingleProductBloc extends Bloc<SingleProductEvent, DescriptionState> {
  SingleProductBloc() : super(LoadingDescriptionState()) {
    on<SingleProductEvent>((event, emit) async {
      emit(LoadingDescriptionState());
      try {
        http.Response response =
            await http.get(Uri.parse("https://fakestoreapi.com/products/ "
                "${event.id}"
                ""));
        // log(response.body, name: "single product");
        var decodeValue = jsonDecode(response.body);

        emit(LoadedDescriptionState(Items.fromJson(decodeValue)));
      } catch (e) {
        log(e.toString());
        emit(ErrorWishlistState());
        throw e;
      }
    });
  }
}
