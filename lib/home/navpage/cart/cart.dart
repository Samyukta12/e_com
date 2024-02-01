import 'package:e_com/home/navpage/cart/bloc/cart_bloc.dart';
import 'package:e_com/home/navpage/cart/bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: BlocConsumer<CartBloc, CartState>(
            listener: (context, state) {
              // handle events here
            },
            builder: (context, state) {
              if (state is LoadedCartState) {
                return Container(
                  child: ListView.builder(
                    itemCount: state.newcartlist.length,
                    itemBuilder: (context, index) {
                      return Text(state.newcartlist[index].id.toString());
                    },
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
