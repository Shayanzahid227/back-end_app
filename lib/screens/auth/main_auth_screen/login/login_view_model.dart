import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hustler_syn/core/base_view_model/base_view_model.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/screens/root_screen/root_screen.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isLoading = false;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get isLoading => _isLoading;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void login() async {
    if (!validateForm()) return;

    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();

    Get.offAll(RootScreen());
  }

  bool validateForm() {
    if (emailController.text.trim().isEmpty ||
        !emailController.text.contains("@") ||
        !emailController.text.contains(".")) {
      _showError("Please enter a valid email");
      return false;
    }

    if (passwordController.text.isEmpty) {
      _showError("Password cannot be empty");
      return false;
    }

    if (passwordController.text.length < 6) {
      _showError("Password must be at least 6 characters long");
      return false;
    }

    return true;
  }

  void _showError(String message) {
    Get.snackbar(
      "Error",
      message,
      colorText: backGroundColor,
      backgroundColor: primaryColor,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
