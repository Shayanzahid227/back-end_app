import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hustler_syn/core/base_view_model/base_view_model.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileViewModel extends BaseViewModel {
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
}
