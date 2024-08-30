import 'package:flutter/material.dart';
import 'package:movies_app_bloc/Config/Components/round_button.dart';
import 'package:movies_app_bloc/Model/User/user_model.dart';
import 'package:movies_app_bloc/Views/Login/Widgets/Email_Input_widget.dart';
import 'package:movies_app_bloc/Views/Login/Widgets/password_input_widget.dart';
import 'package:movies_app_bloc/bloc/Login%20Bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_bloc/bloc/Login%20Bloc/login_state.dart';

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
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(),
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
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (previous, current) => false,
                    builder: (context, state) {
                      print('object');
                      return RoundButton(
                          title: 'Login',
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              if (state.password.length < 6) {
                                print(
                                    "Password cannot be less than 6 characters");
                              }
                              print('I am Here');
                            }
                          });
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }
}
