import 'package:device_preview/device_preview.dart';
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
import 'package:hustler_syn/core/custom_widgets/custom_button.dart';
import 'package:hustler_syn/screens/neccessary_widget/doted_border_container.dart';
import 'package:hustler_syn/screens/profile/edit_profile/edit_profile_view_model.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditProfileViewModel(),
      child: Consumer<EditProfileViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: CustomAppBar(
              title: 'Edit Profile',
              showBackButton: true,
              action: Icon(
                Icons.abc,
                color: backGroundColor,
              )),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  30.verticalSpace,

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
                              backgroundImage: model.webImage != null
                                  ? MemoryImage(model.webImage!)
                                  : model.image != null
                                      ? FileImage(model.image!) as ImageProvider
                                      : AssetImage(AppAssets().userImage),
                            ),
                            GestureDetector(
                              onTap: model.pickImage,
                              child: Positioned(
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
                                      Icons.file_upload_outlined,
                                      color: AppColors.backGroundColor,
                                      size: 18.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        20.verticalSpace,
                        Text(
                          textAlign: TextAlign.center,
                          'Click to upload a new\nprofile photo max size: 4MB',
                          style: style18_500.copyWith(),
                        ),
                        30.verticalSpace,
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
                        Text(
                          'Personal information',
                          style: style18_600,
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

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: CustomButton(
                        text: 'Cancel',
                        textColor: whiteColor,
                        onTap: () {},
                        borderColor: borderColor,
                        gradientColors: [backGroundColor, backGroundColor],
                      )),
                      10.horizontalSpace,
                      Expanded(
                          child: CustomButton(
                        text: 'Save changes',
                        onTap: () {
                          Get.snackbar(
                              colorText: primaryColor,
                              'success',
                              'Profile updated successfully');
                        },
                      )),
                    ],
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
