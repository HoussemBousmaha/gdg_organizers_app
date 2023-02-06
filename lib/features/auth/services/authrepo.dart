import 'dart:convert';
import 'dart:io';

import '../../../constants/const.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  Future<http.Response> login(
    String email,
    String password,
  ) async {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return res;
  }
}
