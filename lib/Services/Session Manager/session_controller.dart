import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies_app_bloc/Model/User/user_model.dart';
import 'package:movies_app_bloc/Services/Storage/local_storage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();

  LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLogin;

  SessionController._internal() {
    isLogin = false;
  }

  factory SessionController() {
    return _session;
  }

  Future<void> saveUserInPreferences(dynamic user) async {
    localStorage.setValue('token', jsonEncode(user));
    localStorage.setValue('isLogin', 'true');
  }

  Future<void> getUserFromPreferences() async {
    try {
      var userdata = await localStorage.getValue('token');
      var isLogin = await localStorage.getValue('isLogin');

      if (userdata.isNotEmpty) {
        SessionController().user = UserModel.fromJson(jsonDecode(userdata));
      }
      SessionController().isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
