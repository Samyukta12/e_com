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
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          itemCount: state.newlist.length,
                          itemBuilder: (BuildContext, index) {
                            return Card(
                              child: Column(
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Product()),
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        child: Image(
                                          image: NetworkImage(
                                            state.newlist[index].image
                                                .toString(),
                                          ),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.12,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                        ),
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
                                      ")")
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
