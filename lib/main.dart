import 'package:e_com/dashboard/navpage/cart/CartList/bloc/cartadd_bloc.dart';
import 'package:e_com/dashboard/navpage/cart/blocApi/cart_bloc.dart';
import 'package:e_com/dashboard/navpage/cart/itemCount/bloc/count_bloc.dart';
import 'package:e_com/dashboard/navpage/homepage/homepage_bloc/h_bloc.dart';
import 'package:e_com/user_auth/ui/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard/bloc/home_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //  await Firebase.initializeApp();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeBloc(),
      ),
      BlocProvider(create: (context) => SingleProductBloc()),
      BlocProvider(create: (context) => CartBloc()),
      BlocProvider(create: (context) => CartAddBloc()),
      BlocProvider(create: (context) => CounterBloc())
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
    return SignUp();
  }
}
