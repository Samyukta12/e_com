import 'package:e_com/home.dart';
import 'package:e_com/navpage/homepage/cart/bloc/cart_bloc.dart';
import 'package:e_com/navpage/homepage/homepage_bloc/h_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeBloc(),
      ),
      BlocProvider(create: (context) => SingleProductBloc()),
      BlocProvider(create: (context) => CartBloc())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
