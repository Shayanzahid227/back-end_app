import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';
import 'package:hustler_syn/screens/profile/help_and_support/help_and_support.dart';
import 'package:hustler_syn/screens/profile/notification_screen/notification_screen.dart';
import 'package:hustler_syn/screens/profile/privacy_and_terms/privacy_and_terms.dart';


// Placeholder for your text styles. You should define these globally in your project.

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: CustomAppBar(
        title: 'Settings',
        showBackButton: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                buildSectionTitle('Account'),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     
                    
                     
                    ],
                  ),
                ),
                buildSectionTitle('Preference'),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildSettingItem(
                        onTap: () {
                          Get.to(NotificationScreen());
                        },
                        image: AppAssets().s4Icon,
                        title: 'Notifications',
                        subtitle: 'Manage push notifications',
                      ),
                      buildSettingItem(
                        onTap: () {
                          Get.to(Get.snackbar('Error', 'UI is not available'));
                        },
                        image: AppAssets().s5Icon,
                        title: 'Appearance',
                        subtitle: 'Light mode',
                      ),
                    ],
                  ),
                ),
                buildSectionTitle('Support'),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildSettingItem(
                        onTap: () {
                          Get.to(HelpSupportScreen());
                        },
                        image: AppAssets().s6Icon,
                        title: 'Help & Support',
                        subtitle: 'FAQs and contact us',
                      ),
                      buildSettingItem(
                        onTap: () {
                          Get.to(PrivacyTermsScreen());
                        },
                        image: AppAssets().s7Icon,
                        title: 'Privacy & Terms',
                        subtitle: 'Legal information',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///. custom widget for each row
  ///
  Widget buildSettingItem({
    required String? image,
    required String title,
    required String subtitle,
    Widget? trailing,
    Color? itemBackgroundColor,
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          leading: Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.10),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(
                image ?? AppAssets().helpIcon,
                color: primaryColor,
              ),
            ),
          ),
          title: Text(
            title,
            style: style16_600,
          ),
          subtitle: Text(
            subtitle,
            style: style14_400.copyWith(color: greyColor),
          ),
          trailing: trailing ??
              Icon(
                Icons.arrow_forward_ios,
                color: greyColor,
                size: 16.w,
              ),
          onTap: onTap,
        ),
        10.verticalSpace,
        Container(
          width: double.infinity,
          height: 1,
          color: borderColor,
        )
      ],
    );
  }

  ///
  /// badge in 3rd row in first container
  ///
  Widget buildVerifiedBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: primaryColor, width: 1.w),
      ),
      child: Text(
        'Verified',
        style: style12_500.copyWith(
            color: backGroundColor, fontWeight: FontWeight.w400),
      ),
    );
  }

  ///
  ///. section title text
  ///

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 25.h, bottom: 10.h),
      child: Text(
        title,
        style: style18_600,
      ),
    );
  }
}
