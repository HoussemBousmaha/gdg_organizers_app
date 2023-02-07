import 'dart:convert';
import 'dart:io';

import '../../../constants/const.dart';
import 'package:dio/dio.dart';

import '../../../shared/services/diohelper.dart';

class AuthApi {
  
 static Future<Response> login(
    String email,
    String password,
  ) async {
    return await DioHelper.postData(
      url: '/admin/login',
      data: {
        'email': email,
        'password': password,
      },
  
    );
}
  static Future<Response> getUser(String token) async {
      return await DioHelper.getData(
        url: '/user/:id',
        token: token,
      );
    }
}