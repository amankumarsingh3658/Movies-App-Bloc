import 'package:movies_app_bloc/Config/AppUrls/appUrls.dart';
import 'package:movies_app_bloc/Data/Network/network_api_services.dart';
import 'package:movies_app_bloc/Model/User/user_model.dart';
import 'package:movies_app_bloc/Repository/Auth/login_repostory.dart';

class LoginHttpApiRepository extends LoginRepostory{
  final _api = NetworkApiServices();

  @override
  Future<UserModel> loginApi(dynamic data)async{
    final response = await _api.postApi(Appurls.loginApi, data);
    return UserModel.fromJson(response);
  }
}