import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hustler_syn/core/model/app_user.dart';

class AuthServices {
  final auth = FirebaseAuth.instance;
  registerUser(AppUserModel user) async {
    final UserCredential = await auth.createUserWithEmailAndPassword(
        email: user.email ?? '', password: user.password ?? '');
    return UserCredential;
  }

  ///
  ///. login user
  ///
  loginUser(AppUserModel user) async {
    final UserCredential = await auth.signInWithEmailAndPassword(
        email: user.email ?? '', password: user.password ?? '');
    return UserCredential;
  }

  ///
  ///
  ///
}
