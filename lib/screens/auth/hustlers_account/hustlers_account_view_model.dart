import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/screens/auth/money_plan/money_plan_screen.dart';
import 'package:image_picker/image_picker.dart';

class HustlersAccountViewModel extends ChangeNotifier {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController languageInputController = TextEditingController();

  String? _profileImagePath;

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final List<String> _languages = [];
  bool _isLoading = false;

  String? get profileImagePath => _profileImagePath;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  List<String> get languages => _languages;
  bool get isLoading => _isLoading;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  void addLanguage() {
    final language = languageInputController.text.trim();
    if (language.isNotEmpty && !_languages.contains(language)) {
      _languages.add(language);
      languageInputController.clear();
      notifyListeners();
    }
  }

  void removeLanguage(String language) {
    _languages.remove(language);
    notifyListeners();
  }

  void setProfileImage(String path) {
    _profileImagePath = path;
    notifyListeners();
  }

  void createAccount() async {
    if (!validateForm()) return;

    _isLoading = true;
    notifyListeners();

    // Placeholder for API call
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();
    Get.to(MoneyPlanScreen());
  }

  bool validateForm() {
    // Basic validation logic
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("error", 'Please fill the form correctly',
          colorText: backGroundColor, backgroundColor: primaryColor);
      return false;
    }

    return true;
  }

  ///
  /// for image picking
  ///
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

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    languageInputController.dispose();
    super.dispose();
  }
}
