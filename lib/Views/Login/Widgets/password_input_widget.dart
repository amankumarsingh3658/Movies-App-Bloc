import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_bloc/bloc/Login%20Bloc/login_bloc.dart';
import 'package:movies_app_bloc/bloc/Login%20Bloc/login_events.dart';
import 'package:movies_app_bloc/bloc/Login%20Bloc/login_state.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode focusNode;
  PasswordInputWidget({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => current.password != previous.password,
      builder: (context, state) {
        return TextFormField(
          focusNode: focusNode,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Password',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Password';
            }
            if (value.length < 6) {
              return "Password cannot be less than 6 characters";
            }
            return null;
          },
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
          onFieldSubmitted: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
        );
      },
    );
  }
}
