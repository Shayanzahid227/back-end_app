import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/screens/auth/hustlers_account/hustlers_account_view_model.dart';
import 'package:hustler_syn/screens/auth/main_auth_screen/main_auth_screen.dart';
import 'package:hustler_syn/screens/auth/money_plan/money_plan_screen.dart';
import 'package:hustler_syn/screens/neccessary_widget/doted_border_container.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/custom_widgets/custom_button.dart';

class HustlerAccountScreen extends StatelessWidget {
  const HustlerAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HustlersAccountViewModel(),
      builder: (context, _) {
        final viewModel = Provider.of<HustlersAccountViewModel>(context);
        return Scaffold(
          backgroundColor: backGroundColor,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.verticalSpace,

                ///
                ///. top logo and create account text
                ///
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets().splashIcon,
                        scale: 4,
                        height: 144.h,
                      ),
                      20.verticalSpace,
                      Text(
                        'Create You\'re Account',
                        style: style25_600.copyWith(fontSize: 32.sp),
                      ),
                      5.verticalSpace,
                      Text(
                        'Sign up as a Client or Hustler to get started',
                        style: style16_400,
                      ),
                    ],
                  ),
                ),
                30.verticalSpace,

                ///
                ///. text above progress bar
                ///
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Step 1 of 2',
                      style: style18_600.copyWith(
                          color: greyColor, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "50%",
                      style: style18_600.copyWith(
                          color: greyColor, fontWeight: FontWeight.w700),
                    )
                  ],
                ),

                ///
                ///
                /// progress bar design manually
                ///
                ///
                Container(
                  width: double.infinity,
                  height: 15.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: borderColor)),
                  child: Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                      ),
                      Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: borderColor),
                            color: borderColor,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10))),
                      )
                    ],
                  ),
                ),

                ///
                ///. personal information text
                ///

                20.verticalSpace,
                Text(
                  'Personal Information',
                  style: style25_400.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                10.verticalSpace,

                ///
                ///
                ///. first main container which contain text form fields etc
                ///
                ///

                Container(
                  decoration: BoxDecoration(
                    color: borderColor.withOpacity(0.4),
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        15.verticalSpace,
                        _buildProfileImagePicker(context, viewModel),
                        30.verticalSpace,
                        Text('Full Name', style: style18_600),
                        8.verticalSpace,
                        TextFormField(
                          style: const TextStyle(color: greyColor),
                          decoration: customAuthField.copyWith(
                            hintText: 'Akbar khan',
                          ),
                        ),
                        20.verticalSpace,
                        Text('Email', style: style18_600),
                        8.verticalSpace,
                        TextFormField(
                          style: const TextStyle(color: greyColor),
                          decoration: customAuthField.copyWith(
                            hintText: 'AkbarKhan@gmail.com',
                          ),
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
                        Text('Phone Number(Optional)', style: style18_600),
                        8.verticalSpace,
                        TextFormField(
                          controller: viewModel.phoneNumberController,
                          style: const TextStyle(color: greyColor),
                          decoration: customAuthField.copyWith(
                            hintText: '+1 (555) 000-0000',
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
                              onPressed:
                                  viewModel.toggleConfirmPasswordVisibility,
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        _buildLanguagesSection(context, viewModel),
                        20.verticalSpace,
                        Text('Select Category', style: style18_600),
                        8.verticalSpace,
                        TextFormField(
                          controller: viewModel.phoneNumberController,
                          style: const TextStyle(color: greyColor),
                          decoration: customAuthField.copyWith(
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: greyColor,
                            ),
                            hintText: 'Select Category',
                          ),
                        ),
                        20.verticalSpace,
                        Text('Starting Price(per hour)', style: style18_600),
                        8.verticalSpace,
                        TextFormField(
                          controller: viewModel.phoneNumberController,
                          style: const TextStyle(color: greyColor),
                          decoration: customAuthField.copyWith(
                            hintText: '25',
                          ),
                        ),
                        30.verticalSpace,
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                Text(
                  'Business Information',
                  style: style25_400.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                ///
                ///. second container which contain business name and service description etc
                ///

                10.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    color: borderColor.withOpacity(0.4),
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Business Name', style: style18_600),
                        8.verticalSpace,
                        TextFormField(
                          style: const TextStyle(color: greyColor),
                          decoration: customAuthField.copyWith(
                            hintText: 'Akbar Khan Plumbing Services ',
                          ),
                        ),
                        20.verticalSpace,
                        Text('Service Business Description',
                            style: style18_600),
                        8.verticalSpace,
                        TextFormField(
                          maxLines: 5,
                          style: const TextStyle(color: greyColor),
                          decoration: customAuthField.copyWith(
                            hintText:
                                'Describe your services, experience, and what makes you unique...',
                          ),
                        ),
                        20.verticalSpace,
                        Text(
                          'Upload Business Image',
                          style: style18_600,
                        ),
                        8.verticalSpace,
                        Text(
                          'Upload Business Image',
                          style: style18_600,
                        ),
                        8.verticalSpace,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildBusinessImagePicker(context, viewModel, 0),
                            _buildBusinessImagePicker(context, viewModel, 1),
                            _buildBusinessImagePicker(context, viewModel, 2),
                            _buildBusinessImagePicker(context, viewModel, 3),
                          ],
                        ),
                        30.verticalSpace,
                      ],
                    ),
                  ),
                ),
                30.verticalSpace,
                // create account button
                _buildContinueToSubscriptionButton(context, viewModel),
                20.verticalSpace,
                _buildLoginLink(context),
                40.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }

  ///
  ///. add language widget
  ///

  Widget _buildLanguagesSection(
    BuildContext context,
    HustlersAccountViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Languages Known', style: style18_600),
        10.verticalSpace,
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: viewModel.languageInputController,
                decoration: customAuthField.copyWith(
                  hintText: 'Add a language',
                ),
                style: const TextStyle(color: greyColor),
              ),
            ),
            10.horizontalSpace,
            SizedBox(
              height: 50.h,
              child: ElevatedButton(
                onPressed: viewModel.addLanguage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  elevation: 0,
                ),
                child: Text(
                  'Add',
                  style: style14_600.copyWith(color: darkPurpleColor),
                ),
              ),
            ),
          ],
        ),
        15.verticalSpace,
        Wrap(
          spacing: 10.w,
          runSpacing: 10.w,
          children: viewModel.languages
              .map(
                (lang) => _LanguageChip(
                  language: lang,
                  onRemove: () => viewModel.removeLanguage(lang),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  ///
  ///. upload image widget
  ///
  Widget _buildProfileImagePicker(
    BuildContext context,
    HustlersAccountViewModel viewModel,
  ) {
    return Column(
      children: [
        Text('Profile image', style: style16_600),
        10.verticalSpace,
        Center(
          child: GestureDetector(
            onTap: viewModel.pickImage,
            child: Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.circular(50.r),
                image: viewModel.webImage != null
                    ? DecorationImage(
                        image: MemoryImage(viewModel.webImage!),
                        fit: BoxFit.cover,
                      )
                    : viewModel.image != null
                        ? DecorationImage(
                            image: FileImage(viewModel.image!),
                            fit: BoxFit.cover,
                          )
                        : null,
              ),
              child: viewModel.image == null && viewModel.webImage == null
                  ? Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 35,
                        color: greyColor,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  ///
  ///. create account button
  ///
  Widget _buildContinueToSubscriptionButton(
    BuildContext context,
    HustlersAccountViewModel viewModel,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: CustomButton(
        textColor: backGroundColor,
        text: viewModel.isLoading ? 'Creating...' : 'Continue to Subscription',

        ///
        /// un comment this using proper logic for form handling
        ///
        onTap: viewModel.isLoading ? () {} : viewModel.createAccount,
        // onTap: () {
        //   Get.to(MoneyPlanScreen());
        // },
      ),
    );
  }

  ///
  ///. text already have an account login widget
  ///
  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: style14_400.copyWith(color: lightGreyColor),
        ),
        GestureDetector(
          onTap: () {
            Get.offAll(AuthScreen());
            print('Navigating to auth Screen');
          },
          child: Text(
            'Log In',
            style: style14_600.copyWith(color: primaryColor),
          ),
        ),
      ],
    );
  }

  ///
  ///. business image picker --> 4 pic in row
  ///
  Widget _buildBusinessImagePicker(
    BuildContext context,
    HustlersAccountViewModel viewModel,
    int index,
  ) {
    return GestureDetector(
      onTap: () => viewModel.pickBusinessImage(index),
      child: DashedBorderContainer(
        width: 80.w,
        height: 80.w,
        child: kIsWeb
            ? viewModel.businessImagesWeb[index] != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.memory(
                      viewModel.businessImagesWeb[index]!,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(
                    Icons.file_upload_outlined,
                    color: greyColor,
                    size: 40,
                  )
            : viewModel.businessImages[index] != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.file(
                      viewModel.businessImages[index]!,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(
                    Icons.file_upload_outlined,
                    color: greyColor,
                    size: 40,
                  ),
      ),
    );
  }
}

///
///. class for language selection
///
class _LanguageChip extends StatelessWidget {
  final String language;
  final VoidCallback onRemove;

  const _LanguageChip({required this.language, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(language, style: style14_400.copyWith(color: Colors.white)),
      backgroundColor: darkPurpleColor,
      side: const BorderSide(color: primaryColor, width: 1),
      deleteIcon: const Icon(Icons.close, size: 18, color: greyColor),
      onDeleted: onRemove,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    );
  }
}

///
/// rough
///
