import 'dart:convert';
import 'dart:io';

import 'package:movies_app_bloc/Data/Exceptions/app_exceptions.dart';
import 'package:movies_app_bloc/Data/Network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic data;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      data = returnRespone(response);
    } on SocketException {
      throw NoInternetException('');
    } on RequestTimeOutException {
      throw RequestTimeOutException('');
    } on Unauthorizedexception {
      throw Unauthorizedexception('');
    } on FetchDataException {
      throw FetchDataException('');
    }
    return data;
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    dynamic data;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
      data = returnRespone(response);
    } on SocketException {
      throw NoInternetException('');
    } on RequestTimeOutException {
      throw RequestTimeOutException('');
    } on Unauthorizedexception {
      throw Unauthorizedexception('');
    } on FetchDataException {
      throw FetchDataException('');
    }
    return data;
  }

  dynamic returnRespone(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic JsonResponse = jsonDecode(response.body);
        return JsonResponse;
      case 400:
        dynamic JsonResponse = jsonDecode(response.body);
        return JsonResponse;
      case 401:
        throw Unauthorizedexception('');
      case 500:
        throw FetchDataException(
            'Error Communicating With Server ${response.statusCode}');
            default: 
            throw FetchDataException('Something Went Wrong');
    }
  }
}
