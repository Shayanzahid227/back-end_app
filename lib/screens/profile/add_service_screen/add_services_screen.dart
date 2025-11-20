import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
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

class AddServicesScreen extends StatelessWidget {
  const AddServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditProfileViewModel(),
      child: Consumer<EditProfileViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          appBar: CustomAppBar(
              title: 'AddServices',
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
                  20.verticalSpace,

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
                          'Services Details',
                          style: style18_600,
                        ),
                        20.verticalSpace,
                        Text(
                          "Business Service Name",
                          style: style18_600,
                        ),
                        8.verticalSpace,
                        TextFormField(
                          decoration: customAuthField
                              .copyWith(hintText: 'Miller Home Services')
                              .withRadius(14.r),
                        ),
                        20.verticalSpace,
                        Text(
                          "Category",
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
                          "Starting Price   ",
                          style: style18_600,
                        ),
                        8.verticalSpace,
                        TextFormField(
                          decoration: customAuthField
                              .copyWith(hintText: '50')
                              .withRadius(14.r),
                        ),
                        20.verticalSpace,
                        20.verticalSpace,
                        Text(
                          "Describe your service in details",
                          style: style18_600,
                        ),
                        8.verticalSpace,
                        TextFormField(
                          maxLines: 3,
                          decoration: customAuthField
                              .copyWith(
                                  hintText: 'Describe your service in details')
                              .withRadius(14.r),
                        ),
                        5.verticalSpace,
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Max 700 Characters',
                            style: style14_400,
                          ),
                        ),
                        10.verticalSpace,
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        color: planCardColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: borderColor)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upload Business Image',
                          style: style18_600,
                        ),
                        8.verticalSpace,

                        ///
                        ///. image adding section
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
                        10.verticalSpace,
                        Text(
                          'You can upload four images',
                          style: style18_600,
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  ),

                  20.verticalSpace,
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
                              'Success',
                              'Services add successfully');
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

  ///
  ///. business image picker --> 4 pic in row
  ///
  Widget _buildBusinessImagePicker(
    BuildContext context,
    EditProfileViewModel viewModel,
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
                    color: AppColors.greyColor,
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
                    color: AppColors.greyColor,
                    size: 40,
                  ),
      ),
    );
  }
}
