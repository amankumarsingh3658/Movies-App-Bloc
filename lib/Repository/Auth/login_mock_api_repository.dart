import 'package:movies_app_bloc/Config/AppUrls/appUrls.dart';
import 'package:movies_app_bloc/Data/Network/network_api_services.dart';
import 'package:movies_app_bloc/Model/User/user_model.dart';
import 'package:movies_app_bloc/Repository/Auth/login_repostory.dart';

class LoginMockApiRepository extends LoginRepostory{

  @override
  Future<UserModel> loginApi(dynamic data)async {
    await Future.delayed(Duration(seconds: 2));
    final response = {
      'token' : 'sdjasdha'
    };
    return UserModel.fromJson(response);
  }
}