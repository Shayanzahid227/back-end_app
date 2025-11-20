import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';
import 'package:hustler_syn/screens/profile/edit_profile/edit_profile_view_model.dart';
import 'package:hustler_syn/screens/profile/referral_and_rewards/referral_and_reward_screen.dart';
import 'package:provider/provider.dart';

class IdVerificationScreen extends StatelessWidget {
  const IdVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditProfileViewModel(),
      child: Consumer<EditProfileViewModel>(
        builder: (context, value, child) => Scaffold(
          appBar: CustomAppBar(
            title: 'ID Verification',
            showBackButton: true,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///
                  ///  top container of progress bar
                  ///
                  CustomContainer(
                    children: [
                      ListTile(
                        titleAlignment: ListTileTitleAlignment.top,
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: primaryColor.withOpacity(0.3),
                          child: Center(
                            child: Image.asset(
                              AppAssets().check3Icon,
                              scale: 4,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        title: Text(
                          'Verified',
                          style: style16_600,
                        ),
                        subtitle: Text(
                          'Your identity is confirmed',
                          style: style14_400,
                        ),
                        trailing: Container(
                            width: 70.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99.r),
                                color: primaryColor),
                            child: Center(
                              child: Text(
                                '✓ Vetted',
                                style: style12_600.copyWith(
                                    color: backGroundColor),
                              ),
                            )),
                      ),
                      10.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Verification Progress',
                            style: style14_400.copyWith(),
                          ),
                          Text(
                            '100',
                            style: style12_600,
                          )
                        ],
                      ),
                      10.verticalSpace,
                      Container(
                        width: double.infinity,
                        height: 8.h,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(999.6)),
                      )
                    ],
                  ),

                  ///
                  ///. verification benefits
                  ///
                  CustomContainer(children: [
                    Text(
                      'Verification Benefits',
                      style: style16_600,
                    ),
                    10.verticalSpace,
                    _verificationRow(
                        title: 'Build Trust',
                        subTitle:
                            'Clients feel more confident hiring\nverified hustlers'),
                    _verificationRow(
                        title: 'Stand Out',
                        subTitle: 'Get the verified badge on your profile'),
                    _verificationRow(
                        title: 'Build Trust',
                        subTitle:
                            ' Verified hustlers get 3x more job\nrequests'),
                    _verificationRow(
                        title: 'Stand Out',
                        subTitle: 'Charge premium rates with verified\nstatus'),
                  ]),
                  10.verticalSpace,

                  ///
                  ///. verification details
                  ///
                  CustomContainer(children: [
                    Text(
                      'Verification Details',
                      style: style16_600,
                    ),
                    10.verticalSpace,
                    _verificationRow(
                        title: 'Government ID',
                        subTitle: 'Verified Nov 15, 2024'),
                    _verificationRow(
                        title: 'Phone number',
                        subTitle: 'Verified Nov 12, 2024'),
                    _verificationRow(
                        title: 'Email Address',
                        subTitle: 'Verified Nov 10, 2024'),
                  ]),

                  ///
                  ///. upload new documents button
                  ///
                  CustomContainer(children: [
                    Text(
                      'Update Documents',
                      style: style16_600,
                    ),
                    10.verticalSpace,
                    Text(
                      'If your ID has expired or changed, you can upload\nnew documents here.',
                      style: style14_400.copyWith(color: greyColor),
                    ),
                    10.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        Get.snackbar(colorText: primaryColor, 'Uploading', 'Uploading new documents');
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_upload_outlined,
                              color: blackColor,
                            ),
                            10.horizontalSpace,
                            Text(
                              'Upload New Documents',
                              style: style14_600.copyWith(color: blackColor),
                            )
                          ],
                        ),
                      ),
                    )
                  ]),

                  ///
                  ///. last container
                  ///
                  _verificationRow(
                      image: AppAssets().helpIcon,
                      title:
                          "Need help? If you're having trouble with\nverification, our support team is here to assist\nyou.")
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  ///
  ///. detail row
  ///
  Widget _verificationRow({String? image, String? title, String? subTitle}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: borderColor)),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.top,
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 15.r,
          backgroundColor: primaryColor.withOpacity(0.3),
          child: Center(
            child: Image.asset(
              image ?? AppAssets().check3Icon,
              scale: 4,
              color: primaryColor,
            ),
          ),
        ),
        title: Text(
          title ?? 'not passed',
          style: style16_600,
        ),
        subtitle: Text(
          subTitle ?? '',
          style: style14_400.copyWith(color: greyColor),
        ),
      ),
    );
  }
}
