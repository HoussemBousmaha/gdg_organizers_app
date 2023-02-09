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
      url: '/user/login',
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

  static Future<Response> updateFcmtoken(String token, String fcmToken) async {
    return await DioHelper.putData(
      url: '/user/fcm/:id',
      token: token,
      data: {
        'fcmToken': fcmToken,
      },
    );
  }

  static Future<Response> updateUser(
      String token, Map<String, dynamic> data) async {
    print(token);
    return await DioHelper.putData(
      url: '/user/:id',
      token: token,
      data: data,
    );
  }
}
