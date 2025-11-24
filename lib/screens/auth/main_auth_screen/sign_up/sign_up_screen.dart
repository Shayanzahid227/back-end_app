import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/custom_button.dart';
import 'package:hustler_syn/screens/auth/main_auth_screen/sign_up/sign_up_view_model.dart';
import 'package:hustler_syn/screens/root_screen/root_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (context, viewModel, child) => SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.verticalSpace,
              Text('Full Name', style: style18_600),
              8.verticalSpace,
              TextFormField(
                controller: viewModel.fullNameController,
                style: const TextStyle(color: greyColor),
                decoration: customAuthField.copyWith(hintText: 'Akbar Khan'),
              ),
              20.verticalSpace,
              Text('Email', style: style18_600),
              8.verticalSpace,
              TextFormField(
                controller: viewModel.emailController,
                style: const TextStyle(color: greyColor),
                decoration:
                    customAuthField.copyWith(hintText: 'AkbarKhan@gmail.com'),
              ),
              20.verticalSpace,
              Text('Password', style: style18_600),
              8.verticalSpace,
              TextFormField(
                controller: viewModel.passwordController,
                obscureText: !viewModel.isPasswordVisible,
                style: const TextStyle(color: greyColor),
                decoration: customAuthField.copyWith(
                  hintText: '************',
                  suffixIcon: IconButton(
                    icon: Icon(
                      viewModel.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: lightGreyColor,
                    ),
                    onPressed: viewModel.togglePasswordVisibility,
                  ),
                ),
              ),
              20.verticalSpace,
              Text('Confirm Password', style: style18_600),
              8.verticalSpace,
              TextFormField(
                controller: viewModel.confirmPasswordController,
                obscureText: !viewModel.isConfirmPasswordVisible,
                style: const TextStyle(color: greyColor),
                decoration: customAuthField.copyWith(
                  hintText: '**********',
                  suffixIcon: IconButton(
                    icon: Icon(
                      viewModel.isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: lightGreyColor,
                    ),
                    onPressed: viewModel.toggleConfirmPasswordVisibility,
                  ),
                ),
              ),
              20.verticalSpace,
              Text('Description', style: style18_600),
              8.verticalSpace,
              TextFormField(
                controller: viewModel.descriptionController,
                style: const TextStyle(color: greyColor),
                decoration: customAuthField.copyWith(hintText: 'Description'),
              ),
              20.verticalSpace,
              Text('Phone number', style: style18_600),
              8.verticalSpace,
              TextFormField(
                controller: viewModel.phoneNumberController,
                style: const TextStyle(color: greyColor),
                decoration:
                    customAuthField.copyWith(hintText: '+92 318 6444164'),
              ),
              20.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: CustomButton(
                    textColor: backGroundColor,
                    text: 'SignUp',
                    onTap: () {
                      viewModel.createAccount();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
