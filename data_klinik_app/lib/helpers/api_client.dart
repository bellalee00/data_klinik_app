//Bella Azka Oktavia (15220775)
// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(
  baseUrl: 'https://656481d8ceac41c0761e50d3.mockapi.io/',
  connectTimeout: Duration(milliseconds: 5000),
  receiveTimeout: Duration(milliseconds: 3000)


));

class ApiClient {
    Future<Response> get(String path) async {
      try {
        final response = await dio.get(Uri.encodeFull(path));
        return response;
      } on DioError catch (e) {
        throw Exception(e.message);
      }
    }

Future<Response> post(String path, dynamic data) async {
  try {
    final response = await dio.post(Uri.encodeFull(path), data: data);
    return response;
  } on DioError catch (e) {
    throw Exception(e.message);
  }
 }

Future<Response> put(String path, dynamic data) async {
  try {
    final response = await dio.put(Uri.encodeFull(path), data: data);
    return response;
  } on DioError catch (e) {
    throw Exception(e.message);
  }
}

Future<Response> delete(String path) async {
  try {
    final response = await dio.delete(Uri.encodeFull(path));
    return response;
  } on DioError catch (e) {
    throw Exception(e.message);
    }
  }
}