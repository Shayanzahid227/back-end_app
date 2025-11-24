import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/colors.dart' as AppColors;
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';

import 'package:hustler_syn/screens/profile/edit_profile/edit_profile_screen.dart';
import 'package:hustler_syn/screens/profile/main_profile/profile_view_model.dart';
import 'package:hustler_syn/screens/profile/setting/setting_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, value, child) => Scaffold(
          appBar: CustomAppBar(
            title: 'Profile',
            showBackButton: false,
            centerTitle: false,
            action: GestureDetector(
              onTap: () {
                Get.to(SettingsScreen());
              },
              child: Icon(
                Icons.settings,
                color: whiteColor,
              ),
            ),
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///
                  ///. top user image and name container
                  ///
                  Container(
                    width: 1.0.sw,
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.planCardColor,
                        border: Border.all(color: borderColor)),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 60.r,
                              backgroundColor: orangeColor,
                              backgroundImage:
                                  AssetImage(AppAssets().userImage),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.all(3.r),
                                decoration: BoxDecoration(
                                  color: AppColors.backGroundColor,
                                  shape: BoxShape.circle,
                                ),
                                child: CircleAvatar(
                                  radius: 15.r,
                                  backgroundColor: AppColors.primaryColor,
                                  child: Icon(
                                    Icons.check_circle_outline,
                                    color: AppColors.backGroundColor,
                                    size: 18.w,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'John Smith',
                          style: style22_400.copyWith(
                              fontSize: 23.sp, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '@johnsmith',
                          style: style18_500.copyWith(
                              fontWeight: FontWeight.w400, color: greyColor),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),

                  ///
                  /// first container --> profile details
                  ///
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: BoxDecoration(
                        color: planCardColor,
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Profile details',
                              style: style18_600,
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(EditProfileScreen());
                                },
                                child: Text(
                                  'Edit',
                                  style: style14_600,
                                ))
                          ],
                        ),
                        20.verticalSpace,
                        Text(
                          "Full name",
                          style: style18_600,
                        ),
                        8.verticalSpace,
                        TextFormField(
                          decoration: customAuthField
                              .copyWith(hintText: 'Shayan ZAhid')
                              .withRadius(14.r),
                        ),
                        20.verticalSpace,
                        Text(
                          "Email",
                          style: style18_600,
                        ),
                        8.verticalSpace,
                        TextFormField(
                          decoration: customAuthField
                              .copyWith(hintText: 'Email')
                              .withRadius(14.r),
                        ),
                        20.verticalSpace,
                        Text(
                          "Phone",
                          style: style18_600,
                        ),
                        8.verticalSpace,
                        TextFormField(
                          decoration: customAuthField
                              .copyWith(hintText: '+92 318 6444164')
                              .withRadius(14.r),
                        ),
                        20.verticalSpace,
                        Text(
                          "About me",
                          style: style18_600,
                        ),
                        8.verticalSpace,
                        TextFormField(
                          maxLines: 3,
                          decoration: customAuthField
                              .copyWith(
                                  hintText:
                                      'Experienced handyman and home renovation specialist with 10+ years of experience. Passionate about helping people transform their spaces.')
                              .withRadius(14.r),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Account & Settings',
                    style: style18_600,
                  ),
                  8.verticalSpace,

                  ///
                  /// 4th container
                  ///

                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    decoration: BoxDecoration(
                        color: planCardColor,
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ///
                          ///. first row
                          ///
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                height: 20.h,
                                width: 20.w,
                                image: AssetImage(
                                  AppAssets().bagIcon,
                                ),
                                color: whiteColor,
                              ),
                              10.horizontalSpace,
                              Text('Settings', style: style16_600),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    Get.to(SettingsScreen());
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: whiteColor,
                                  ))
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            color: borderColor,
                            height: 1,
                          ),
                          10.verticalSpace,

                          ///
                          ///. second row
                          ///
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                height: 20.h,
                                width: 20.w,
                                image: AssetImage(
                                  AppAssets().bagIcon,
                                ),
                                color: Colors.red,
                              ),
                              10.horizontalSpace,
                              Text('Delete Account',
                                  style:
                                      style16_600.copyWith(color: Colors.red)),
                            ],
                          ),
                          8.verticalSpace,
                          Container(
                            width: double.infinity,
                            color: borderColor,
                            height: 1,
                          ),
                          10.verticalSpace,

                          ///
                          ///. 3rd row
                          ///
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                height: 20.h,
                                width: 20.w,
                                image: AssetImage(
                                  AppAssets().bagIcon,
                                ),
                                color: Colors.red,
                              ),
                              10.horizontalSpace,
                              Text('LogOut',
                                  style:
                                      style16_600.copyWith(color: Colors.red)),
                            ],
                          ),
                        ]),
                  ),

                  50.verticalSpace,
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}

class CustomTextStyles {
  static TextStyle style20_700 = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.whiteColor);
  static TextStyle style14_500 = TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.greyColor);
  static TextStyle style14_600 = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor);
}
