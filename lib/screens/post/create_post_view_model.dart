import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hustler_syn/core/base_view_model/base_view_model.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/model/create_new_post.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostViewModel extends BaseViewModel {
 

  ///
  ///. business image picker in a row in end of screen
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
