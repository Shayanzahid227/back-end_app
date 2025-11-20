import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
// Assuming these are imports from your project structure
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';
import 'package:hustler_syn/core/custom_widgets/custom_button.dart';
import 'package:hustler_syn/screens/profile/privacy_and_terms/privacy_and_terms.dart';
import 'package:hustler_syn/screens/profile/referral_and_rewards/referral_and_reward_screen.dart';
// Local imports for this example

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, top: 25.h, bottom: 10.h),
      child: Text(
        title,
        style: style18_600.copyWith(color: whiteColor),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        collapsedIconColor: greyColor,
        iconColor: primaryColor,
        title: Text(
          question,
          style: style16_500,
        ),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 15.h),
            child: Text(
              answer,
              style: style14_400.copyWith(color: greyColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required String hintText, bool isMultiLine = false}) {
    return TextFormField(
      maxLines: isMultiLine ? 5 : 1,
      style: style14_400.copyWith(color: whiteColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: style14_400.copyWith(color: greyColor.withOpacity(0.7)),
        filled: true,
        fillColor: backGroundColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: CustomAppBar(
        title: 'Help & Support',
        showBackButton: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Frequently Asked Questions'),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: backGroundColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    _buildFAQItem(
                        'How do I post a job?', 'Steps on posting a job...'),
                    _buildFAQItem('How can I become a verified Hustler?',
                        'Requirements for verification...'),
                    _buildFAQItem('How do I cancel my subscription?',
                        'Subscription cancellation guide...'),
                    _buildFAQItem('How does payment on Stripe work?',
                        'Details about Stripe integration...'),
                    _buildFAQItem('What if I\'m not satisfied with a service?',
                        'Dispute resolution process...'),
                    _buildFAQItem('How do ratings and reviews work?',
                        'Explanation of rating system...'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomContainer(children: [
                  _buildSectionTitle('Contact Support'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your email', style: style14_500.copyWith()),
                        8.verticalSpace,
                        TextFormField(
                          decoration: customAuthField.copyWith(
                              hintText: 'Your.email@example.com'),
                        ),
                        15.verticalSpace,
                        Text('Describe your issue...',
                            style: style14_500.copyWith()),
                        8.verticalSpace,
                        TextFormField(
                          maxLines: 4,
                          decoration: customAuthField.copyWith(
                            hintText:
                                'Please provide as much detail as possible about your issue',
                          ),
                        ),
                        20.verticalSpace,
                        CustomButton(
                          text: 'Submit Request',
                          onTap: () {
                            Get.snackbar(
                                colorText: primaryColor,
                                'Success',
                                'Request submitted successfully');
                          },
                          textColor: blackColor,
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.all(15.w),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.to(PrivacyTermsScreen());
                            },
                            child: Text('Terms & Conditions',
                                style:
                                    style14_500.copyWith(color: primaryColor))),
                        Text(
                          '      •      ',
                          style: style14_500.copyWith(color: greyColor),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(PrivacyTermsScreen());
                            },
                            child: Text('Privacy Policy',
                                style:
                                    style14_500.copyWith(color: primaryColor))),
                      ],
                    ),
                    5.verticalSpace,
                    Text('App Version 1.0G', style: style14_400.copyWith()),
                  ],
                ),
              ),
              40.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
