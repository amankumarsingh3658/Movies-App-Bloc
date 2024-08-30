import 'package:flutter/material.dart';
import 'package:movies_app_bloc/Config/Routes/routesName.dart';
import 'package:movies_app_bloc/Services/Session%20Manager/session_controller.dart';
import 'package:movies_app_bloc/Services/Storage/local_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
        actions: [
          IconButton(
              onPressed: () {
                LocalStorage localStorage = LocalStorage();

                localStorage.clearValue('token').then((value) {
                  localStorage.clearValue('isLogin');
                }).then((value) {
                  Navigator.pushNamed(context, RoutesName.loginScreen);
                });
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}
