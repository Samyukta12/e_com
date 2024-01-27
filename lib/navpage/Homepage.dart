import 'package:e_com/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_state.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Container(
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ResponseState) {
                if (state.newlist.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                        itemCount: state.newlist.length,
                        itemBuilder: (BuildContext, index) {
                          return (state.newlist.length == 0)
                              ? Container(
                            // color: Colors.purple,
                              height: 40,
                              width: 40,
                              child: Text("empty"))
                              : Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Image(
                                    image: NetworkImage(state
                                        .newlist[index].image
                                        .toString())),
                                Text(
                                  state.newlist[index].title,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Product description : " +
                                      state.newlist[index].description,
                                ),

                                // Text(state.newlist[index].id.toString()),
                                Text(state.newlist[index].category
                                    .toString()),

                                Text("Rating : " +
                                    state.newlist[index].rating.rate
                                        .toString()),
                              ],
                            ),
                          );
                        }),
                  );
                } else {
                  return Text("Empty newlist");
                }
              } else {
                return Center(child: Text("State is not ResponseState"));
              }
            },
          ),
        ),
      ),
    );
  }
}
