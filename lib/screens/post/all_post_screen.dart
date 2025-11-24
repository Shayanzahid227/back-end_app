import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/constant/colors.dart' as AppColors;
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';
import 'package:hustler_syn/core/custom_widgets/custom_button.dart';
import 'package:hustler_syn/core/custom_widgets/langugae_chil.dart';
import 'package:hustler_syn/screens/neccessary_widget/doted_border_container.dart';
import 'package:hustler_syn/screens/post/all_post_view_model.dart';
import 'package:provider/provider.dart';

class AllPostScreen extends StatelessWidget {
  const AllPostScreen({super.key});

 

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AllPostViewModel(),
      child: Consumer<AllPostViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: const CustomAppBar(title: "Create New Post"),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                ///. job title
                ///
                Text('Job Title', style: style18_600.copyWith()),
                8.verticalSpace,
                TextField(
                    decoration: customAuthField.copyWith(
                        hintText: "e.g., Need a Flutter Developer")),
                20.verticalSpace,

                ///
                ///. description
                ///
                Text('Description', style: style18_600.copyWith()),
                8.verticalSpace,
                TextField(
                    maxLines: 3,
                    decoration: customAuthField.copyWith(
                        hintText: "Describe what you need help with...")),
                20.verticalSpace,

                ///
                ///. category section
                ///
                Text('Category', style: style18_600.copyWith()),
                8.verticalSpace,

                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 0.8,
                        color: AppColors.borderColor,
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      dropdownColor: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      focusColor: Colors.transparent,
                      value: viewModel.selectCategory,
                      hint: Text(
                        "Please Select",
                        style: style14_500.copyWith(color: AppColors.greyColor),
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.greyColor,
                      ),
                      isExpanded: true,
                      style: style14_500.copyWith(color: AppColors.whiteColor),
                      items: viewModel.categories.map((String categoryName) {
                        return DropdownMenuItem(
                          value: categoryName,
                          child: Text(
                            categoryName,
                            style: style14_500.copyWith(
                                color: AppColors.greyColor),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        viewModel.selectCategoryClick(value);
                      },
                    ),
                  ),
                ),
                20.verticalSpace,

                ///
                ///. budget price section
                ///
                Text('Budget Price',
                    style: style18_600.copyWith(color: Colors.white)),
                8.verticalSpace,
                TextField(
                    decoration:
                        customAuthField.copyWith(hintText: "e.g., \$200")),
                20.verticalSpace,

                ///
                ///. add and remove language section
                ///
                _buildLanguagesSection(context, viewModel),
                20.verticalSpace,

                ///
                ///. use my current location
                ///
                Text('Job Location',
                    style: style18_600.copyWith(color: Colors.white)),
                8.verticalSpace,
                TextField(
                    decoration: customAuthField.copyWith(
                        prefixIcon: Icon(
                          Icons.location_on_outlined,
                          color: AppColors.greyColor,
                        ),
                        hintText: "Use my Current location")),
                30.verticalSpace,

                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Use my current location',
                      style:
                          style14_600.copyWith(color: AppColors.primaryColor),
                    )),
                20.verticalSpace,
                Text('Job Images',
                    style: style18_600.copyWith(color: Colors.white)),
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
                8.verticalSpace,
                Text(
                  'You can upload 4 images',
                  style: style12_500.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.greyColor),
                ),
                30.verticalSpace,

                ///
                ///. submit button
                ///
                CustomButton(
                    text: 'Submit Post',
                    onTap: () {
                      Get.snackbar(
                          colorText: AppColors.primaryColor,
                          'Success',
                          'Post created successfully');
                    }),
                50.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///. language section
  ///

  Widget _buildLanguagesSection(
    BuildContext context,
    AllPostViewModel viewModel,
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
                style: const TextStyle(color: AppColors.greyColor),
              ),
            ),
            10.horizontalSpace,
            SizedBox(
              height: 50.h,
              child: ElevatedButton(
                onPressed: viewModel.addLanguage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  elevation: 0,
                ),
                child: Text(
                  'Add',
                  style: style14_600.copyWith(color: AppColors.darkPurpleColor),
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
  ///. business image picker --> 4 pic in row
  ///
  Widget _buildBusinessImagePicker(
    BuildContext context,
    AllPostViewModel viewModel,
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
