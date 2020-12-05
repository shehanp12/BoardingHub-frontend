import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/utils/authentication/auth_service.dart';
import 'package:flutter/services.dart';

class FirebaseAuthService implements AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
     await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

  }

  @override
  Future<User> createUserWithEmailAndPassword(String email, String password) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<User> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  // TODO: implement onAuthStateChanged
  Stream<User> get onAuthStateChanged => throw UnimplementedError();

}