import 'package:e_com/navpage/homepage/cart/bloc/cart_bloc.dart';
import 'package:e_com/navpage/homepage/cart/bloc/cart_event.dart';
import 'package:e_com/navpage/homepage/cart/bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    context.read<CartBloc>().add(AddCartEvent());
    super.initState();
  }

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
                        return Column(
                          children: [
                            Text(state.newcartlist[index].id.toString()),
                            Text(state.newcartlist[index].date.toString()),

                          ],
                        );
                      },
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ));
  }
}
