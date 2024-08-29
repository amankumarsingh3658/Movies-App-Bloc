import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app_bloc/Config/Routes/routesName.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.loginScreen, (route) => false));
  }
}
