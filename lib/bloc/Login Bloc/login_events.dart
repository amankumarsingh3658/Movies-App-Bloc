import 'package:equatable/equatable.dart';

abstract class LoginEvents extends Equatable {
  LoginEvents();
}

class EmailChanged extends LoginEvents {
  final String email;
  EmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class EmailUnfocus extends LoginEvents {
  @override
  List<Object?> get props => [];
}

class PasswordChanged extends LoginEvents {
  final String password;
  PasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

class PasswordUnfocus extends LoginEvents {
  @override
  List<Object?> get props => [];
}

class LoginButton extends LoginEvents {
  @override
  List<Object?> get props => [];
}
