import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hustler_syn/core/model/app_user.dart';
import 'package:hustler_syn/core/services/auth_services.dart';

class DataBaseServices {
  final _db = FirebaseFirestore.instance;

  ///
  ///. set user data in data_base
  ///
  Future<bool> setUserDate(AppUserModel appUser) async {
    try {
      await _db
          .collection('user_data')
          .doc(appUser.id)
          .set(appUser.toJson());
      Get.snackbar("Success", 'User information saved');
      return true;
    } catch (e) {
      Get.snackbar("Error", 'User information not saved due to $e');
      return false;
    }
  }
}
