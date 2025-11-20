import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/screens/auth/client_account/client_account-screen.dart';
import 'package:hustler_syn/screens/auth/hustlers_account/hustler_account_screen.dart';
import 'package:hustler_syn/screens/auth/hustlers_account/hustlers_account_view_model.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildRoleCard({
      required String title,
      required String subtitle,
      VoidCallback? onTap,
    }) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backGroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: style20_600.copyWith(fontWeight: FontWeight.w700),
              ),
              5.verticalSpace,
              Text(subtitle, style: style16_500),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Referral Code
          Text(
            'Referral Code (optional)',
            style: style16_600.copyWith(fontSize: 18.sp),
          ),
          10.verticalSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: customAuthField.copyWith(
                    hintText: 'Enter referral code',
                  ),
                  style: const TextStyle(color: greyColor),
                ),
              ),
              10.horizontalSpace,
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Apply',
                    style: style16_400.copyWith(color: blackColor),
                  ),
                ),
              ),
            ],
          ),

          20.verticalSpace,

          // Role Selection Cards
          buildRoleCard(
            onTap: () {
              Get.to(ClientAccountScreen());
            },
            title: "I'm a Client",
            subtitle: 'I need services and want to hire professionals',
          ),
          20.verticalSpace,
          buildRoleCard(
            onTap: () {
              Get.to(HustlerAccountScreen());
            },
            title: "I'm a Hustler",
            subtitle: 'I offer services and want to find work',
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
