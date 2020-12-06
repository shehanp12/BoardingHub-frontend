import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class RestService{

  final String host = "http://localhost:5001/boardinghub/us-central1/";

  Future<http.Response> signupUser(user, token) {
    var data = {"user": user, "appType": "USER"};
    return http.post(host+'api/auth/signup',
        headers: {
          HttpHeaders.authorizationHeader: "Basic $token",
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode(data));
  }






}