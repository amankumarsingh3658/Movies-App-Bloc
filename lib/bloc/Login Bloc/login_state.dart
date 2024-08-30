import 'package:equatable/equatable.dart';
import 'package:movies_app_bloc/Utils/enums.dart';

class LoginState extends Equatable {
  PostApiStatus postApiStatus;
  String email;
  String password;
  String message;
  LoginState(
      {this.email = '',
      this.password = '',
      this.postApiStatus = PostApiStatus.initial,
      this.message = ''});

  LoginState copyWith(
      {String? email,
      String? password,
      PostApiStatus? postApiStatus,
      String? message}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        postApiStatus: postApiStatus ?? this.postApiStatus,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [email, password, postApiStatus,message];
}
