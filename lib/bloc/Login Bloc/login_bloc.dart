import 'package:bloc/bloc.dart';
import 'package:movies_app_bloc/bloc/Login%20Bloc/login_events.dart';
import 'package:movies_app_bloc/bloc/Login%20Bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginBloc() : super(LoginState()){
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
  }
  void _emailChanged(EmailChanged event, Emitter<LoginState> emit){
    emit(state.copyWith(email: event.email));
  }
  void _passwordChanged(PasswordChanged event, Emitter<LoginState> emit){
    emit(state.copyWith(password: event.password));
  }
}

