import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hustler_syn/core/base_view_model/base_view_model.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/enums/view_state.dart';
import 'package:hustler_syn/core/model/app_user.dart';
import 'package:hustler_syn/core/services/auth_services.dart';
import 'package:hustler_syn/core/services/data_base_services.dart';
import 'package:hustler_syn/screens/root_screen/root_screen.dart';

class SignUpViewModel extends BaseViewModel {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  bool get isLoading => _isLoading;

  final AuthServices authServices = AuthServices();
  final DataBaseServices _db = DataBaseServices();
  final AppUserModel appUser = AppUserModel();

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  void createAccount() async {
    if (!validateForm()) return;

    _isLoading = true;
    notifyListeners();

    final result = await authServices.registerUser(appUser);

    _isLoading = false;
    notifyListeners();

    if (result == null) {
      Get.snackbar("Error", "Registration failed",
          backgroundColor: primaryColor, colorText: backGroundColor);
      return;
    }

    await _db.setUserDate(appUser);

    Get.snackbar("Success", "Account created successfully",
        backgroundColor: primaryColor, colorText: backGroundColor);

    Get.offAll(() => RootScreen());
  }

  bool validateForm() {
    if (fullNameController.text.trim().isEmpty) {
      _showError("Please enter your full name");
      return false;
    }

    if (emailController.text.trim().isEmpty ||
        !emailController.text.contains("@") ||
        !emailController.text.contains(".")) {
      _showError("Please enter a valid email");
      return false;
    }

    if (passwordController.text.trim().isEmpty) {
      _showError("Password cannot be empty");
      return false;
    }

    if (passwordController.text.trim().length < 6) {
      _showError("Password must be at least 6 characters long");
      return false;
    }

    if (confirmPasswordController.text.trim().isEmpty) {
      _showError("Confirm your password");
      return false;
    }

    if (passwordController.text != confirmPasswordController.text) {
      _showError("Passwords do not match");
      return false;
    }

    appUser.name = fullNameController.text.trim();
    appUser.email = emailController.text.trim();
    appUser.password = passwordController.text.trim();

    return true;
  }

  void _showError(String message) {
    Get.snackbar("Error", message,
        colorText: backGroundColor, backgroundColor: primaryColor);
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
