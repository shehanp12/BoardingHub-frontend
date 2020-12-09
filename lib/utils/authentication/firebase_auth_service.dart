// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_app/models/BoardingProvider.dart';
// import 'package:flutter_app/utils/authentication/auth_service.dart';
// import 'package:flutter_app/utils/rest_service.dart';
// import 'package:http/http.dart';
//
// class FirebaseAuthService implements AuthService {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final RestService restService = RestService();
// User user;
//   @override
//   Future<User> signInWithEmailAndPassword(String email, String password) async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//
//       await for (var firebaseUser in _firebaseAuth.authStateChanges()) {
//         return firebaseUser;
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//       return null;
//     }
//   }
//
//   @override
//   Future<Response> createUserWithEmailAndPassword(
//       BoardingProvider boardingProvider, String password) async {
//     print(boardingProvider);
//     try {
//       await _firebaseAuth.createUserWithEmailAndPassword(email: boardingProvider.email, password: password);
//       _firebaseAuth.currentUser.getIdToken(true).then((idToken) =>restService.signupUser(boardingProvider, idToken) );
//
//
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Future<User> currentUser() async {
//     return _firebaseAuth.currentUser;
//   }
// }
