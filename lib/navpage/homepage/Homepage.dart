import 'package:e_com/bloc/home_bloc.dart';
import 'package:e_com/navpage/homepage/product_desc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ResponseState) {
              if (state.newlist.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          itemCount: state.newlist.length,
                          itemBuilder: (BuildContext, index) {
                            return Card(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Product(
                                                  id: state.newlist[index].id,
                                                )),
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      child: Image(
                                        image: NetworkImage(
                                          state.newlist[index].image.toString(),
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.12,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1, // Adjust the flex value as needed
                                    child: Text(
                                      state.newlist[index].title,
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Text("Rating: " +
                                      state.newlist[index].rating.rate
                                          .toString() +
                                      "(" +
                                      (state.newlist[index].rating.count
                                          .toString()) +
                                      ")"),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                        onTap: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                                          print("cart is clicked");
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 243, 177, 153),
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Text("Add to cart")),
                                        )),
                                  ),
                                  GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 30,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 243, 177, 153),
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text("Add to wishlist")),
                                      ))
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Text("Empty newlist");
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
