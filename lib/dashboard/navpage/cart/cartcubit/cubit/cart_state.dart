part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartSuccess extends CartState {
  final List<Items> items;

  CartSuccess(this.items);
}

final class CartLoading extends CartState {}

final class CartError extends CartState {}
