import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gdg_organizers_app/shared/services/diohelper.dart';

import 'authrepo.dart';

class AuthRepo {
  static final _secureStorage = const FlutterSecureStorage();

 static Future<Response> login(String email, String password) async {
    final Response response = await AuthApi.login(email, password);
    print(response.data);
    return response;
  }

 static Future<Response> getUser(String token) async {
    final Response response = await AuthApi.getUser(token);
    print(response.data);
    return response;
  } 

  static Future<Map<String , dynamic>> updateimage (String token, String image) async {
    final String response = await DioHelper.uploadImage(token, image);
    return jsonDecode(response) ;
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
}
