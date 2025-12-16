import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/custom_button.dart';
import 'package:hustler_syn/screens/auth/main_auth_screen/sign_up/sign_up_view_model.dart';
import 'package:provider/provider.dart';

import 'login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, _) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.verticalSpace,

                /// Email Label
                Text('Email', style: style18_600),
                10.verticalSpace,

                TextFormField(
                  controller: viewModel.emailController,
                  decoration: customAuthField.copyWith(
                    hintText: 'rana.akbarkhan12@gmail.com',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: greyColor),
                ),

                15.verticalSpace,
                Text('Password', style: style18_600),
                10.verticalSpace,

                /// Password Field
                TextFormField(
                  controller: viewModel.passwordController,
                  obscureText: !viewModel.isPasswordVisible,
                  style: const TextStyle(color: greyColor),
                  decoration: customAuthField.copyWith(
                    hintText: '********',
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

                48.verticalSpace,

                /// Login Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: CustomButton(
                    textColor: backGroundColor,
                    text: viewModel.isLoading ? "Processing..." : 'Login',
                    onTap: () {
                      if (!viewModel.isLoading) {
                        viewModel.loginUser();
                      }
                    },
                  ),
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

                24.verticalSpace,
              ],
            ),
          );
        },
      ),
    );
  }
}
