import 'package:e_com/user_login/bloc/signup_event.dart';
import 'package:e_com/user_login/bloc/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent,SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<SignUpEvent>((event, emit) {
 
    });
  }
}