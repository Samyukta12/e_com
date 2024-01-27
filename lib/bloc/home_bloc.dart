import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_com/bloc/home_event.dart';
import 'package:e_com/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart'as http;

import '../model/item_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitialState()) {
    on<InitialEvent>((event, emit) => initialEvent(event, emit));

  }

  List<Items> list = [];

  void initialEvent(Object? event, Emitter<HomeState> emit) {
    emit(ResponseState(list));
    http.get(Uri.parse("https://fakestoreapi.com/products")).then((response) {
      if (response.statusCode == 200) {

        List<Items> itemsList = itemsFromJson(response.body);


        list.addAll(itemsList);



      } else {

        print("Failed to load data. Status code: ${response.statusCode}");
      }
    });
  }

}
