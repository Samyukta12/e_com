import 'package:e_com/home/navpage/homepage/homepage_bloc/h_bloc.dart';
import 'package:e_com/home/navpage/homepage/homepage_bloc/h_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homepage_bloc/h_state.dart';

class Product extends StatefulWidget {
  final int id;

  Product({required this.id});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  void initState() {
    super.initState();
    context.read<SingleProductBloc>().add(SingleProductEvent(id: widget.id));
    // BlocProvider.of<SingleProductBloc>(context).add(SingleProductEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text("AppBar"),
      ),
      body: BlocBuilder<SingleProductBloc, DescriptionState>(
          builder: (context, state) {
        if (state is LoadingDescriptionState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedDescriptionState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    child: Image(
                      image: NetworkImage(state.item.image),
                    )),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.favorite_border, size: 40),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.pink[50]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "20% off",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Price: ${state.item.price}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Rating :${state.item.rating} ( ${state.item.rating.count} )',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  '${state.item.category}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  'Description: ${state.item.description}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        }
        if (state is ErrorWishlistState) {
          return Text("error");
        } else {
          return Text("implementation wrong");
        }
      }),
    );
  }
}
