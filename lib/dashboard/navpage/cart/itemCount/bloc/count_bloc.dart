import 'package:e_com/dashboard/navpage/cart/itemCount/bloc/count_event.dart';
import 'package:e_com/dashboard/navpage/cart/itemCount/bloc/count_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncrementCounterEvent>((event, emit) {
      incrementCounterEvent(event, emit);
    });
    on<DecrementCounterEvent>((event, emit) {
      decrementCounterEvent(event, emit);
    });
  }

  void incrementCounterEvent(
      IncrementCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrementCounterEvent(
      DecrementCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
