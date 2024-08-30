import 'package:flutter/material.dart';
import 'package:movies_app_bloc/Config/Components/loadingButton.dart';
import 'package:movies_app_bloc/Config/Components/round_button.dart';
import 'package:movies_app_bloc/Config/Routes/routesName.dart';
import 'package:movies_app_bloc/Repository/Auth/login_repostory.dart';
import 'package:movies_app_bloc/Utils/enums.dart';
import 'package:movies_app_bloc/Utils/flush_bar_helper.dart';
import 'package:movies_app_bloc/Views/Login/Widgets/Email_Input_widget.dart';
import 'package:movies_app_bloc/Views/Login/Widgets/password_input_widget.dart';
import 'package:movies_app_bloc/bloc/Login%20Bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_bloc/bloc/Login%20Bloc/login_events.dart';
import 'package:movies_app_bloc/bloc/Login%20Bloc/login_state.dart';
import 'package:movies_app_bloc/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(loginRepostory: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmailInputWidget(
                    focusNode: emailFocusNode,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PasswordInputWidget(
                    focusNode: passwordFocusNode,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocListener<LoginBloc, LoginState>(
                    listenWhen: (previous, current) =>
                        current.postApiStatus != previous.postApiStatus,
                    listener: (context, state) {
                      if (state.postApiStatus == PostApiStatus.error) {
                        FlushBarHelper.flushBarErrorMessage(
                            state.message, context);
                      }
                      if (state.postApiStatus == PostApiStatus.success) {
                       Navigator.pushNamed(context, RoutesName.homeScreen);
                      }
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: (previous, current) =>
                          current.postApiStatus != previous.postApiStatus,
                      builder: (context, state) {
                        if (state.postApiStatus == PostApiStatus.loading) {
                          return LoadingButton();
                        } else {
                          return RoundButton(
                              title: 'Login',
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<LoginBloc>().add(LoginButton());
                                  
                                }
                              });
                        }
                      },
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
