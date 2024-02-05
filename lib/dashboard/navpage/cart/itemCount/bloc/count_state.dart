import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counter;

  CounterState({this.counter = 1});

  CounterState copyWith({int? counter}) {
    final updatedCounter =
        (counter ?? this.counter) <= 1 ? 1 : (counter ?? this.counter);

    return CounterState(counter: updatedCounter);
  }

  @override
  List<Object?> get props => [counter];
}
