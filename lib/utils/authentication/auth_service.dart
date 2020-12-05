import 'dart:async';
import 'package:flutter_app/models/BoardingProvider.dart';
import 'package:http/http.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService{

  Future<User> currentUser();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<Response> createUserWithEmailAndPassword(BoardingProvider boardingProvider, String password);
  Stream<User> get onAuthStateChanged;

}