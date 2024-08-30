import 'package:bloc/bloc.dart';
import 'package:movies_app_bloc/Repository/Auth/login_repostory.dart';
import 'package:movies_app_bloc/Services/Session%20Manager/session_controller.dart';
import 'package:movies_app_bloc/Utils/enums.dart';
import 'package:movies_app_bloc/bloc/Login%20Bloc/login_events.dart';
import 'package:movies_app_bloc/bloc/Login%20Bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginRepostory loginRepostory;
  LoginBloc({required this.loginRepostory}) : super(LoginState()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<LoginButton>(_loginButton);
  }
  void _emailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginButton(LoginButton event, Emitter<LoginState> emit) async {
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    dynamic data = {'email': state.email, 'password': state.password};

    await loginRepostory.loginApi(data).then((value) async {
      if (value.error.isNotEmpty) {
        emit(state.copyWith(
            message: value.error.toString(),
            postApiStatus: PostApiStatus.error));
      } else {
        await SessionController().saveUserInPreferences(value);
        await SessionController().getUserFromPreferences();
        emit(state.copyWith(
            message: value.token.toString(),
            postApiStatus: PostApiStatus.success));
      }
    }).onError(
      (error, stackTrace) {
        emit(state.copyWith(
            message: error.toString(), postApiStatus: PostApiStatus.error));
      },
    );
  }
}
