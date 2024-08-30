import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies_app_bloc/Config/Routes/routesName.dart';
import 'package:movies_app_bloc/Services/Session%20Manager/session_controller.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController().getUserFromPreferences().then((value) {
      if (SessionController().isLogin == true) {
        print(SessionController().user);
        Timer(
            Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.homeScreen, (route) => false));
      } else {
        Timer(
            Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.loginScreen, (route) => false));
      }
    }).onError(
      (error, stackTrace) {
        Timer(
            Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.loginScreen, (route) => false));
      },
    );
  }
}
