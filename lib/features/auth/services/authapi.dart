import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gdg_organizers_app/models/user/user.dart';
import 'package:http/http.dart' as http;

import 'authrepo.dart';

class AuthRepo {
  final AuthApi _authApi = AuthApi();
  final _secureStorage = const FlutterSecureStorage();

  Future<http.Response> login(String email, String password) async {
    final http.Response response = await _authApi.login(email, password);
    return response;
  }

  Future<void> deleteData() async {
    await _secureStorage.deleteAll();
    await _secureStorage.delete(key: 'x-auth-token');
    await _secureStorage.delete(key: 'x-auth-refershToken');
  }

  Future<void> persistData(token) async {
    await _secureStorage.write(key: 'x-auth-token', value: token);
  }

  Future<String?> getToken() async {
    final token = await _secureStorage.read(key: 'x-auth-token');
    return token;
  }
}
