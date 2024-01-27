import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final String email;
  final String password;
  SignUpState({required this.email, required this.password});

  SignUpState copyWith({String? email, String? password}) {
    return copyWith(
        email: email ?? this.email, password: password ?? this.password);
  }

  @override
  List<Object?> get props => [email, password];
}
