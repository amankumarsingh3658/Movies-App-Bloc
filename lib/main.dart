import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app_bloc/Config/Routes/routes.dart';
import 'package:movies_app_bloc/Config/Routes/routesName.dart';
import 'package:movies_app_bloc/Repository/Auth/login_http_api_repository.dart';
import 'package:movies_app_bloc/Repository/Auth/login_mock_api_repository.dart';
import 'package:movies_app_bloc/Repository/Auth/login_repostory.dart';
import 'package:movies_app_bloc/Views/Splash/splash_screen.dart';


GetIt getIt = GetIt.instance;
void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

void serviceLocator(){
  getIt.registerLazySingleton<LoginRepostory>(()=> LoginHttpApiRepository());
}

