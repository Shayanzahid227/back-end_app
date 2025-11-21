import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hustler_syn/core/model/app_user.dart';

class AuthServices {
  final auth = FirebaseAuth.instance;
  registerUser(UserModel user) async {
    try {
      // ignore: unused_local_variable, non_constant_identifier_names
      final UserCredential = await auth.createUserWithEmailAndPassword(
          email: user.email ?? '', password: user.password ?? '');
      return UserCredential;
    } catch (e) {
      if (kDebugMode) {
        print('User not register due to $e');
      }
    }
  }

  ///
  ///. login user
  ///
  loginUser(UserModel user) async {
    try {
      // ignore: unused_local_variable, non_constant_identifier_names
      final UserCredential = await auth.signInWithEmailAndPassword(
          email: user.email ?? '', password: user.password ?? '');
      return UserCredential;
    } catch (e) {
      if (kDebugMode) {
        print('User not login due to $e');
      }
    }
  }

  ///
  ///
  ///
}
