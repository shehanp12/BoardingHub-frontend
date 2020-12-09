import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/BoardingProvider.dart';
import 'package:http/http.dart' as http;

class Response {
  final String token;
  final String message;

  Response({this.token, this.message});

  Response.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        token = json['token'];
}

class MyHttpException extends HttpException {
  final int statusCode;
  MyHttpException(this.statusCode, String message) : super(message);
}


class NetworkUtils {
  static Future get(Uri url, {Map<String, String> headers}) async {
    final response = await http.get(url, headers: headers);
    final body = response.body;
    final statusCode = response.statusCode;
    if (body == null) {
      throw MyHttpException(statusCode, 'Response body is null');
    }
    final decoded = json.decode(body);
    if (statusCode < 200 || statusCode >= 300) {
      throw MyHttpException(statusCode, decoded['message']);
    }
    return decoded;
  }

  static Future post(Uri url,
      {Map<String, String> headers, Map<String, String> body}) {
    return _helper('POST', url, headers: headers, body: body);
  }

  static Future _helper(String method, Uri url,
      {Map<String, String> headers, Map<String, String> body}) async {
    final request = new http.Request(method, url);
    if (body != null) {
      request.bodyFields = body;
    }
    if (headers != null) {
      request.headers.addAll(headers);
    }
    final streamedReponse = await request.send();

    final statusCode = streamedReponse.statusCode;
    final decoded = json.decode(await streamedReponse.stream.bytesToString());

    debugPrint('decoded: $decoded');

    if (statusCode < 200 || statusCode >= 300) {
      throw MyHttpException(statusCode, decoded['message']);
    }

    return decoded;
  }

  static Future put(Uri url, {Map<String, String> headers, body}) {
    return _helper('PUT', url, headers: headers, body: body);
  }
}


class RestService {

  final String host = 'http://192.168.43.237:5000/api/';
  final String xAccessToken = 'x-access-token';


  Future<http.Response> registerUser( boardingProvider) async {

    return http.post(host+ 'user/register',body: jsonEncode(boardingProvider));

  }


}

