import 'package:flutter/material.dart';
import 'package:movies_app_bloc/Config/Routes/routesName.dart';
import 'package:movies_app_bloc/Views/viewbarrel.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case RoutesName.splashScreen:
        return  MaterialPageRoute(builder: (context)=> const SplashScreen());
      case RoutesName.homeScreen:
        return  MaterialPageRoute(builder: (context)=> const HomeScreen());
      case RoutesName.loginScreen:
        return  MaterialPageRoute(builder: (context)=> const LoginScreen());
        default: return MaterialPageRoute(builder: (context){
          return Scaffold(
            body: Center(
              child: Text("No Routes Generated"),
            ),
          );
        });
    }
  }
}