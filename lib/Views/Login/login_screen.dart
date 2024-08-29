import 'package:flutter/material.dart';
import 'package:movies_app_bloc/Model/User/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserModel userModel = UserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}