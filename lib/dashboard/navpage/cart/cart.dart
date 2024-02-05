import 'package:e_com/constant/color_constant.dart';
import 'package:e_com/dashboard/navpage/cart/CartList/bloc/cartadd_bloc.dart';
import 'package:e_com/dashboard/navpage/cart/itemCount/bloc/count_bloc.dart';
import 'package:e_com/dashboard/navpage/cart/itemCount/bloc/count_event.dart';
import 'package:e_com/dashboard/navpage/cart/itemCount/bloc/count_state.dart';
import 'package:e_com/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.background,
        automaticallyImplyLeading: false,
        title: Center(child: Text("MyCart")),
      ),
      backgroundColor: ColorConstant.background,
      body: BlocBuilder<CartAddBloc, List<Items>>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConstant.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: MediaQuery.of(context).size.width * 0.2,
                          alignment: Alignment.centerLeft,
                          child: Image.network(state[index].image),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                  state[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                  ),
                                  maxLines: 2,
                                  softWrap: true,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text('Rs. 100'),
                              ),
                              Container(
                                child: Center(
                                  child:
                                      BlocConsumer<CounterBloc, CounterState>(
                                    listener: (context, state) {},
                                    builder: (context, state) {
                                      return Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<CounterBloc>()
                                                  .add(DecrementCounterEvent());
                                            },
                                            child: Icon(Icons.remove),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 5, right: 5),
                                            width: 30,
                                            color: ColorConstant.box,
                                            child: Center(
                                              child: Text(
                                                state.counter.toString(),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<CounterBloc>()
                                                  .add(IncrementCounterEvent());
                                            },
                                            child: Icon(Icons.add),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
