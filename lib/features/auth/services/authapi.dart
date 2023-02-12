import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../shared/services/diohelper.dart';
import 'authrepo.dart';

class AuthRepo {
  static const _secureStorage = FlutterSecureStorage();

  static Future<Response> login(String email, String password) async {
    final Response response = await AuthApi.login(email, password);
    return response;
  }

  static Future<Response> getUser(String token) async {
    final Response response = await AuthApi.getUser(token);
    return response;
  }

  static Future<Response> updateUser(String token, Map<String, dynamic> data) async {
    final Response response = await AuthApi.updateUser(token, data);
    return response;
  }

  static Future<Response> sendFeedback(String token, double rating, String feedback) async {
    final Response response = await AuthApi.sendFeedback(token, rating, feedback);
    print(response.data);
    return response;
  }

  static Future<Map<String, dynamic>> updateimage(String token, String image) async {
    final String response = await DioHelper.uploadImage(token, image);
    return jsonDecode(response);
  }

  static Future<Response> updatePassword(String token, String oldpassword, String newpassword) async {
    final Response response = await AuthApi.updatePassword(token, oldpassword, newpassword);
    return response;
  }

  static Future<void> deleteData() async {
    await _secureStorage.deleteAll();
    await _secureStorage.delete(key: 'x-auth-token');
  }

  static Future<void> persistData(token) async {
    await _secureStorage.write(key: 'x-auth-token', value: token);
  }

  static Future<String?> getToken() async {
    final token = await _secureStorage.read(key: 'x-auth-token');
    return token;
  }

  static FutureOr<void> updateFcmtoken(
    String fcmToken,
    String token,
  ) async {
    await AuthApi.updateFcmtoken(token, fcmToken);
  }
}
