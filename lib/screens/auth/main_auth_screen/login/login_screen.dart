import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/custom_button.dart';
import 'package:hustler_syn/screens/root_screen/root_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // Email Label
          Text('Email', style: style18_600),
          10.verticalSpace,

          TextFormField(
            decoration: customAuthField.copyWith(
              hintText: 'rana.akbarkhan12@gmial.com',
            ),
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: greyColor),
          ),

          15.verticalSpace,
          Text('Password', style: style18_600),
          10.verticalSpace,

          // Password Field
          TextFormField(
            decoration: customAuthField.copyWith(hintText: '********'),
            obscureText: true,
            style: const TextStyle(color: greyColor),
          ),

          const SizedBox(height: 48),

          // Login Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: CustomButton(textColor: backGroundColor,
                text: 'Login',
                onTap: () {
                  Get.offAll(RootScreen());
                }),
          ),

          30.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account? ", style: style14_400),
              GestureDetector(
                onTap: () {
                  DefaultTabController.of(context).animateTo(1);
                },
                child: Text(
                  'Sign Up',
                  style: style14_600.copyWith(color: primaryColor),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
