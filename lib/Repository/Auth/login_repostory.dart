import 'package:movies_app_bloc/Config/AppUrls/appUrls.dart';
import 'package:movies_app_bloc/Data/Network/network_api_services.dart';
import 'package:movies_app_bloc/Model/User/user_model.dart';

abstract class LoginRepostory {


  Future<UserModel> loginApi(dynamic data);

  
}
