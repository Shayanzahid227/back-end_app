import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/colors.dart' as AppColors;
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';
import 'package:hustler_syn/core/model/app_user.dart';
import 'package:hustler_syn/screens/profile/edit_profile/edit_profile_screen.dart';
import 'package:hustler_syn/screens/profile/main_profile/profile_view_model.dart';
import 'package:hustler_syn/screens/profile/setting/setting_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel()..userData(),
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
                                backgroundImage: (value.appUser.image != null &&
                                        value.appUser.image!.isNotEmpty)
                                    ? NetworkImage(value.appUser.image!)
                                        as ImageProvider
                                    : AssetImage(AppAssets().userImage),
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
                            value.appUser.name ?? 'John Smith',
                            style: style22_400.copyWith(
                                fontSize: 23.sp, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            (value.appUser.name != null &&
                                    value.appUser.name!.isNotEmpty)
                                ? '@${value.appUser.name!.replaceAll(' ', '').toLowerCase()}'
                                : '@johnsmith',
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        color: planCardColor,
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Profile details',
                                style: style18_600,
                              ),
                              TextButton(
                                onPressed: () async {
                                  // await Edit screen; if it returns true, refresh profile data
                                  final result =
                                      await Get.to(() => EditProfileScreen());
                                  if (result == true) {
                                    // re-fetch user data so the screen shows the latest changes
                                    await value.userData();
                                  }
                                },
                                child: Text('Edit', style: style14_600),
                              ),
                            ],
                          ),

                          20.verticalSpace,

                          // FULL NAME
                          Text("Full name", style: style18_600),
                          8.verticalSpace,
                          Container(
                            width: 1.sw,
                            padding: EdgeInsets.all(14.r),
                            decoration: BoxDecoration(
                              color: backGroundColor,
                              borderRadius: BorderRadius.circular(14.r),
                              border: Border.all(color: borderColor),
                            ),
                            child: Text(
                              value.appUser.name ?? "Shayan Zahid",
                              style: style16_500,
                            ),
                          ),

                          20.verticalSpace,

                          // EMAIL
                          Text("Email", style: style18_600),
                          8.verticalSpace,
                          Container(
                            width: 1.sw,
                            padding: EdgeInsets.all(14.r),
                            decoration: BoxDecoration(
                              color: backGroundColor,
                              borderRadius: BorderRadius.circular(14.r),
                              border: Border.all(color: borderColor),
                            ),
                            child: Text(
                              value.appUser.email ?? "example@gmail.com",
                              style: style16_500,
                            ),
                          ),

                          20.verticalSpace,

                          // PHONE
                          Text("Phone", style: style18_600),
                          8.verticalSpace,
                          Container(
                            width: 1.sw,
                            padding: EdgeInsets.all(14.r),
                            decoration: BoxDecoration(
                              color: backGroundColor,
                              borderRadius: BorderRadius.circular(14.r),
                              border: Border.all(color: borderColor),
                            ),
                            child: Text(
                              value.appUser.phoneNumber ?? "+92 318 6444164",
                              style: style16_500,
                            ),
                          ),

                          20.verticalSpace,

                          // ABOUT ME
                          Text("About me", style: style18_600),
                          8.verticalSpace,
                          Container(
                            width: 1.sw,
                            padding: EdgeInsets.all(14.r),
                            decoration: BoxDecoration(
                              color: backGroundColor,
                              borderRadius: BorderRadius.circular(14.r),
                              border: Border.all(color: borderColor),
                            ),
                            child: Text(
                              value.appUser.description ??
                                  "Experienced handyman and home renovation specialist with 10+ years of experience. Passionate about helping people transform their spaces.",
                              style: style16_500,
                            ),
                          ),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
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
                                    style: style16_600.copyWith(
                                        color: Colors.red)),
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
                                    style: style16_600.copyWith(
                                        color: Colors.red)),
                              ],
                            ),
                          ]),
                    ),

                    50.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
