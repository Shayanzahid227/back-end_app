import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/screens/root_screen/root_screen.dart';
import 'package:image_picker/image_picker.dart';

class ClientAccountViewModel extends ChangeNotifier {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController languageInputController = TextEditingController();

  String? _profileImagePath;
  bool _agreedToTerms = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final List<String> _languages = [];
  bool _isLoading = false;

  String? get profileImagePath => _profileImagePath;
  bool get agreedToTerms => _agreedToTerms;
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

  void toggleTermsAgreement(bool? newValue) {
    if (newValue != null) {
      _agreedToTerms = newValue;
      notifyListeners();
    }
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
    Get.offAll(RootScreen());
  }

  bool validateForm() {
    // Basic validation logic
    if (passwordController.text != confirmPasswordController.text) {
       Get.snackbar("error", 'Please fill the form',
          colorText: backGroundColor, backgroundColor: primaryColor);
      return false;
    }
    if (!_agreedToTerms) {
      Get.snackbar("error", 'Please follow terms and conditions',
          colorText: backGroundColor, backgroundColor: primaryColor);
      return false;
    }
    return true;
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
}
