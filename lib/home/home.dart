import 'package:e_com/home/bloc/home_event.dart';
import 'package:e_com/home/navpage/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../Homepage.dart';
import 'bloc/home_bloc.dart';
import 'navpage/favourites.dart';
import 'navpage/search.dart';

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

  List navlist = [HomePage(), Search(), Favourites(), Cart()];

  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 246, 207, 193),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              // DrawerHeader(child: ),
              ListTile(leading: Icon(Icons.person), title: Text("Profile")),
              ListTile(leading: Icon(Icons.settings), title: Text("Setting")),
              ListTile(leading: Icon(Icons.logout), title: Text("Logout"))
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        automaticallyImplyLeading: false,
        title: Center(child: Text("Shop here ")),
        backgroundColor: const Color.fromARGB(255, 243, 177, 153),
      ),
      body: navlist[selectedindex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: selectedindex,
        onTap: (value) {
          selectedindex = value;
          setState(() {});
        },
        backgroundColor: const Color.fromARGB(255, 248, 199, 181),
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
      ),
    );
  }
}
