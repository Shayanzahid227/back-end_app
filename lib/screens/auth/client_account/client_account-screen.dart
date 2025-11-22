
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/screens/auth/client_account/client_account_view_model.dart';
import 'package:hustler_syn/screens/auth/main_auth_screen/main_auth_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/custom_widgets/custom_button.dart';

class ClientAccountScreen extends StatelessWidget {
  const ClientAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ClientAccountViewModel(),
      builder: (context, _) {
        final viewModel = Provider.of<ClientAccountViewModel>(context);
        return Scaffold(
          backgroundColor: backGroundColor,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.verticalSpace,
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
                Text(
                  'Personal Information',
                  style: style25_400.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
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
                        30.verticalSpace,
                        _buildTermsAgreement(context, viewModel),
                        30.verticalSpace,
                        _buildCreateAccountButton(context, viewModel),
                        20.verticalSpace,
                        _buildLoginLink(context),
                        40.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///
  ///

  Widget _buildLanguagesSection(
    BuildContext context,
    ClientAccountViewModel viewModel,
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
                (lang) => LanguageChip(
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
  ///
  Widget _buildProfileImagePicker(
    BuildContext context,
    ClientAccountViewModel viewModel,
  ) {
    return Column(
      children: [
        Text('Profile image', style: style16_600),
        10.verticalSpace,
        Center(
          child: GestureDetector(
            onTap: viewModel.pickImage,
            //  () async {
            //   final ImagePicker picker = ImagePicker();
            //   final XFile? image = await picker.pickImage(
            //     source: ImageSource.gallery,
            //     maxWidth: 600,
            //     maxHeight: 600,
            //   );
            //   if (image != null) {
            //     viewModel.setProfileImage(image.path);
            //   }
            // },
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
                        color: viewModel.image == null
                            ? greyColor
                            : transparentColor,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTermsAgreement(
    BuildContext context,
    ClientAccountViewModel viewModel,
  ) {
    return Row(
      children: [
        Checkbox(
          shape: CircleBorder(),
          value: viewModel.agreedToTerms,
          onChanged: viewModel.toggleTermsAgreement,
          activeColor: primaryColor,
          checkColor: darkPurpleColor,
          side: const BorderSide(color: greyColor, width: 2),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'I agree to the ',
              style: style14_400,
              children: [
                TextSpan(
                  text: 'Terms & Conditions',
                  style: style14_600.copyWith(
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: ' Privacy Policy',
                  style: style14_500.copyWith(color: primaryColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateAccountButton(
    BuildContext context,
    ClientAccountViewModel viewModel,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: CustomButton(
        text: viewModel.isLoading ? 'Creating...' : 'Create Account',
        onTap: viewModel.isLoading ? () {} : viewModel.createAccount,
      ),
    );
  }

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
            print('Navigating to Login');
          },
          child: Text(
            'Log In',
            style: style14_600.copyWith(color: primaryColor),
          ),
        ),
      ],
    );
  }
}

class LanguageChip extends StatelessWidget {
  final String language;
  final VoidCallback onRemove;

  const LanguageChip({required this.language, required this.onRemove});

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
