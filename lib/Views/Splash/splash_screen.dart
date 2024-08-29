import 'package:flutter/material.dart';
import 'package:movies_app_bloc/Config/Components/internet_exception_widget.dart';
import 'package:movies_app_bloc/Config/Components/loading_widget.dart';
import 'package:movies_app_bloc/Config/Components/round_button.dart';
import 'package:movies_app_bloc/Config/Routes/routesName.dart';
import 'package:movies_app_bloc/Data/Exceptions/app_exceptions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final height = mq.height;
    final width = mq.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [InternetExceptionWidget(onPress: (){},)],
        )),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        throw NoInternetException('Check your Internet connection');
      }),
    );
  }
}
