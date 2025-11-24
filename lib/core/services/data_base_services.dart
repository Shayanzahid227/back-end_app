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
      await _db.collection('user_data').doc(appUser.id).set(appUser.toJson());
      Get.snackbar("Success", 'User information saved');
      return true;
    } catch (e) {
      print('error: $e');
      Get.snackbar("Error", 'User information not saved due to $e');
      return false;
    }
  }

  ///
  ///. get current user data
  ///
  Future<AppUserModel?> getCurrentUserData() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid == null) return null;

      DocumentSnapshot doc = await _db.collection('user_data').doc(uid).get();

      if (doc.exists) {
        return AppUserModel.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('error: $e');
      return null;
    }
  }
  ///
  ///. update current user data
  ///
  Future<AppUserModel?> updateCurrentUserData(Map<String, dynamic> data) async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid == null) return null;

      // update returns Future<void>, so perform the update and then fetch the document
      await _db.collection('user_data').doc(uid).update(data);

      DocumentSnapshot doc = await _db.collection('user_data').doc(uid).get();

      if (doc.exists) {
        return AppUserModel.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('error: $e');
      return null;
    }
  }
}
