import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gdg_organizers_app/constants/const.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class DioHelper {
  static late Dio dio;

  DioHelper() {
    init();
  }
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: uri,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
        receiveDataWhenStatusError: true,
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
      options: Options(
        headers: {
          'authorization': token,
        },)
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio.delete(
      url,
      queryParameters: query,
    );
  }

  static Future<String> uploadImage(String path , String token) async {
    http.MultipartRequest req =
        http.MultipartRequest('PUT', Uri.parse('$uri/user/image/:id'));
    req.files.add(await http.MultipartFile.fromPath('images', path));
    req.headers.addAll({
      'authorization': token,
    });
    http.StreamedResponse res = await req.send();
    return await res.stream.bytesToString();
}
}