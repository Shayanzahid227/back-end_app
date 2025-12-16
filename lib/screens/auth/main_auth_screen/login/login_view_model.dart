import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hustler_syn/core/base_view_model/base_view_model.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/model/app_user.dart';
import 'package:hustler_syn/core/services/auth_services.dart';
import 'package:hustler_syn/core/services/data_base_services.dart';
import 'package:hustler_syn/screens/root_screen/root_screen.dart';

class LoginViewModel extends BaseViewModel {
  final AuthServices authServices = AuthServices();
  final DataBaseServices _db = DataBaseServices();
  final AppUserModel appUser = AppUserModel();

  ///
  ///
  ///

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ///
  ///
  ///
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get isLoading => _isLoading;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
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

  ///
  ///. login user
  ///
  void loginUser() async {
    if (!validateForm()) return;

    _isLoading = true;
    notifyListeners();

    try {
      appUser.email = emailController.text.trim();
      appUser.password = passwordController.text.trim();

      final result = await authServices.loginUser(appUser);

      final createdUid = result.user?.uid;
      if (createdUid != null) {
        appUser.id = createdUid;
      }

      _isLoading = false;
      notifyListeners();

      Get.snackbar(
        "Success",
        "Login successful",
        backgroundColor: primaryColor,
        colorText: backGroundColor,
      );

      Get.offAll(() => RootScreen());
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      notifyListeners();

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        _showError("Email or password is incorrect");
      } else if (e.code == 'invalid-email') {
        _showError("Invalid email format");
      } else {
        _showError(e.message ?? "Authentication failed");
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      _showError("Something went wrong. Please try again.");
    }
  }
}
