import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hustler_syn/core/base_view_model/base_view_model.dart';
import 'package:hustler_syn/core/enums/view_state.dart';
import 'package:hustler_syn/core/model/app_user.dart';
import 'package:hustler_syn/core/services/data_base_services.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileViewModel extends BaseViewModel {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File? image;
  Uint8List? webImage;

  Future pickImage() async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.gallery);
    if (result == null) return;
    if (kIsWeb) {
      webImage = await result.readAsBytes();
    } else {
      image = File(result.path);
    }
    notifyListeners();
  }

  ///
  ///. business image picker in a row in end of screen
  ///
  ///. used in add services screen
  ///
  List<File?> businessImages = [null, null, null, null];
  List<Uint8List?> businessImagesWeb = [null, null, null, null];

  Future pickBusinessImage(int index) async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.gallery);
    if (result == null) return;

    if (kIsWeb) {
      businessImagesWeb[index] = await result.readAsBytes();
    } else {
      businessImages[index] = File(result.path);
    }
    notifyListeners();
  }

  ///
  ///
  ///
  DataBaseServices _db = DataBaseServices();
  AppUserModel appUser = AppUserModel();

  ///
  ///. update user data
  ///
  Future<bool> updateCurrentUserData(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);

      final updatedModel = await _db.updateCurrentUserData(data);

      if (updatedModel != null) {
        appUser = updatedModel;
        notifyListeners();
        return true;
      } else {
        // update failed or document not found
        return false;
      }
    } catch (e) {
      print('error in updateCurrentUserData: $e');
      return false;
    } finally {
      setState(ViewState.idle);
    }
  }
}
