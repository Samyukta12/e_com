import 'package:e_com/constant/color_constant.dart';
import 'package:e_com/dashboard/bloc/home_event.dart';
import 'package:e_com/dashboard/navpage/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'bloc/home_bloc.dart';
import 'navpage/favourites.dart';
import 'navpage/homepage/Homepage.dart';
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

  List navlist = [const HomePage(), Search(), Favourites(), Cart()];

  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: ColorConstant.background,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: const [
              // DrawerHeader(child: ),
              ListTile(leading: Icon(Icons.person), title: Text("Profile")),
              ListTile(leading: Icon(Icons.settings), title: Text("Setting")),
              ListTile(leading: Icon(Icons.logout), title: Text("Logout"))
            ],
          ),
        ),
      ),
      // appBar: AppBar(
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton(
      //         icon: const Icon(Icons.menu),
      //         onPressed: () {
      //           Scaffold.of(context).openDrawer();
      //         },
      //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //       );
      //     },
      //   ),
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Color.fromARGB(255, 228, 119, 80),
      // ),
      body: navlist[selectedindex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: selectedindex,
        onTap: (value) {
          selectedindex = value;
          setState(() {});
        },
        backgroundColor: ColorConstant.redColor,
        items: [
          SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: ColorConstant.pink),
          SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text("Search"),
              selectedColor: ColorConstant.pink),
          SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text("Favourite"),
              selectedColor: ColorConstant.pink),
          SalomonBottomBarItem(
              icon: const Icon(Icons.shopping_cart),
              title: const Text("Cart"),
              selectedColor: ColorConstant.pink),
        ],
      ),
    );
  }
}
