import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/colors.dart' as AppColors;
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';
import 'package:hustler_syn/core/custom_widgets/custom_button.dart';
import 'package:hustler_syn/core/enums/view_state.dart';
import 'package:hustler_syn/core/custom_widgets/doted_border_container.dart';
import 'package:hustler_syn/screens/profile/edit_profile/edit_profile_view_model.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditProfileViewModel>(
      // call init() to load user data right after creation
      create: (context) {
        final vm = EditProfileViewModel();
    
        return vm;
      },
      child: Consumer<EditProfileViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: CustomAppBar(
            title: 'Edit Profile',
            showBackButton: true,
            action: Icon(
              Icons.abc,
              color: backGroundColor,
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                        border: Border.all(color: borderColor),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 60.r,
                                backgroundColor: orangeColor,
                                backgroundImage: AssetImage(AppAssets().userImage)   ),
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
                            'Full name',
                            style: style18_600,
                          ),
                          8.verticalSpace,
                          TextFormField(
                            controller: model.nameController,
                            decoration: customAuthField
                                .copyWith(hintText: 'Full name')
                                .withRadius(14.r),
                          ),
                          20.verticalSpace,
                          Text(
                            "Email",
                            style: style18_600,
                          ),
                          8.verticalSpace,
                          TextFormField(
                            controller: model.emailController,
                            decoration: customAuthField
                                .copyWith(hintText: 'Email')
                                .withRadius(14.r),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          20.verticalSpace,
                          Text(
                            "Phone",
                            style: style18_600,
                          ),
                          8.verticalSpace,
                          TextFormField(
                            controller: model.phoneController,
                            decoration: customAuthField
                                .copyWith(hintText: '+92 318 6444164')
                                .withRadius(14.r),
                            keyboardType: TextInputType.phone,
                          ),
                          20.verticalSpace,
                          Text(
                            "About me",
                            style: style18_600,
                          ),
                          8.verticalSpace,
                          TextFormField(
                            controller: model.descriptionController,
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
                            onTap: () {
                              Get.back(result: false);
                            },
                            borderColor: borderColor,
                            gradientColors: [backGroundColor, backGroundColor],
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: CustomButton(
                            text: model.state == ViewState.busy
                                ? 'Saving...'
                                : 'Save changes',
                            // disable while saving by returning early inside onTap
                            onTap: () async {
                              if (model.state == ViewState.busy) return;

                              // hide keyboard
                              FocusScope.of(context).unfocus();

                              // basic validation
                              final name = model.nameController.text.trim();
                              final email = model.emailController.text.trim();

                              if (name.isEmpty) {
                                Get.snackbar('Validation', 'Please enter your full name',
                                    snackPosition: SnackPosition.BOTTOM);
                                return;
                              }

                              if (email.isEmpty) {
                                Get.snackbar('Validation', 'Please enter your email',
                                    snackPosition: SnackPosition.BOTTOM);
                                return;
                              }

                              // Build the update map from controllers
                              final Map<String, dynamic> data = {
                                'name': name,
                                'email': email,
                                'phoneNumber': model.phoneController.text.trim(),
                                'description': model.descriptionController.text.trim(),
                                // Note: image uploading to storage is not handled here.
                              };

                              try {
                                final success = await model.updateCurrentUserData(data);

                                if (success) {
                                  // notify user + pop back to profile screen with `true`
                                  Get.snackbar(
                                    'Success',
                                    'Profile updated successfully',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green.withOpacity(0.08),
                                  );

                                  // Return true so previous screen (ProfileScreen) can refresh
                                  Get.back(result: true);
                                } else {
                                  Get.snackbar(
                                    'Error',
                                    'Failed to update profile',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red.withOpacity(0.08),
                                  );
                                }
                              } catch (e) {
                                Get.snackbar('Error', 'An unexpected error occurred',
                                    snackPosition: SnackPosition.BOTTOM);
                                print('update error: $e');
                              }
                            },
                          ),
                        ),
                      ],
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