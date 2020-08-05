import 'dart:async';

import 'package:dio/dio.dart';

class NetUtils {
  final dio = Dio();

  Future _get(String url, {Map<String, dynamic> params}) async {
    var response = await dio.get(url, queryParameters: params);
    return response.data;
  }

  Stream post(String url, Map<String, dynamic> params) =>
      Stream.fromFuture(_post(url, params)).asBroadcastStream();

  Stream get(String url, {Map<String, dynamic> params}) =>
      Stream.fromFuture(_get(url, params: params)).asBroadcastStream();

  Future _post(String url, Map<String, dynamic> params) async {
    var response = await dio.post(url, data: params);
    return response.data;
  }
}
