import 'package:flutter/material.dart';
import 'package:movies_app_bloc/Config/Components/internet_exception_widget.dart';
import 'package:movies_app_bloc/Config/Components/loading_widget.dart';
import 'package:movies_app_bloc/Config/Components/round_button.dart';
import 'package:movies_app_bloc/Config/Routes/routesName.dart';
import 'package:movies_app_bloc/Data/Exceptions/app_exceptions.dart';
import 'package:movies_app_bloc/Services/Splash/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    _splashServices.isLogin(context);
  } 

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final height = mq.height;
    final width = mq.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Text(
          "Splash Screen",
          style: TextStyle(fontSize: 16),
        )),
      ),
    );
  }
}
