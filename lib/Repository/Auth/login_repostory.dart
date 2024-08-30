import 'package:movies_app_bloc/Config/AppUrls/appUrls.dart';
import 'package:movies_app_bloc/Data/Network/network_api_services.dart';
import 'package:movies_app_bloc/Model/User/user_model.dart';

class LoginRepostory {
  final _api = NetworkApiServices();


  Future<UserModel> loginApi(dynamic data)async{
    final response = await _api.postApi(Appurls.loginApi, data);
    return UserModel.fromJson(response);
  }
}