import 'package:e_com/bloc/home_bloc.dart';
import 'package:e_com/bloc/home_event.dart';
import 'package:e_com/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'navpage/Homepage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<HomeBloc>().add(InitialEvent());
    super.initState();
  }

  List navlist = [HomePage(), HomePage(), HomePage(), HomePage()];

  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Shop here ")),
          backgroundColor: const Color.fromARGB(255, 241, 157, 127),
        ),
        body: navlist[selectedindex],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: 0,
          onTap: (value) {
            selectedindex = value;
          },
          backgroundColor: const Color.fromARGB(255, 228, 158, 132),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Favourite"),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Cart"),
              selectedColor: Colors.pink,

            ),
          ],
        ));
  }
}
