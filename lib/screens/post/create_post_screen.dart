import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/constant/colors.dart' as AppColors;
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';
import 'package:hustler_syn/core/custom_widgets/custom_button.dart';
import 'package:hustler_syn/core/custom_widgets/doted_border_container.dart';
import 'package:hustler_syn/screens/post/create_post_view_model.dart';
import 'package:provider/provider.dart';

class CreateNewPostScreen extends StatelessWidget {
  const CreateNewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreatePostViewModel(),
      child: Consumer<CreatePostViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: const CustomAppBar(title: "Create New Post"),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                /// Title
                ///
                Text('Title', style: style18_600),
                8.verticalSpace,
                TextField(
                  //  controller: viewModel.titleController,
                  decoration: customAuthField.copyWith(
                    hintText: "Enter post title",
                  ),
                ),
                20.verticalSpace,

                ///
                /// Description
                ///
                Text('Description', style: style18_600),
                8.verticalSpace,
                TextField(
                  //  controller: viewModel.descriptionController,
                  maxLines: 3,
                  decoration: customAuthField.copyWith(
                    hintText: "Enter description...",
                  ),
                ),
                30.verticalSpace,

                ///
                /// Images Section
                ///
                Text('Images (optional)', style: style18_600),
                8.verticalSpace,

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildImagePicker(context, viewModel, 0),
                    _buildImagePicker(context, viewModel, 1),
                    _buildImagePicker(context, viewModel, 2),
                    _buildImagePicker(context, viewModel, 3),
                  ],
                ),

                8.verticalSpace,
                Text(
                  'You can upload up to 4 images',
                  style: style12_500.copyWith(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                35.verticalSpace,

                ///
                /// Submit Button
                ///
                CustomButton(
                  text: 'Submit Post',
                  onTap: () {
                    //  viewModel.createPost();

                    Get.snackbar(
                      'Success',
                      'Post created successfully',
                      colorText: AppColors.primaryColor,
                    );
                  },
                ),

                50.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  /// Image Picker
  ///
  Widget _buildImagePicker(
    BuildContext context,
    CreatePostViewModel viewModel,
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
                : Icon(Icons.file_upload_outlined,
                    color: AppColors.greyColor, size: 40)
            : viewModel.businessImages[index] != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.file(
                      viewModel.businessImages[index]!,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(Icons.file_upload_outlined,
                    color: AppColors.greyColor, size: 40),
      ),
    );
  }
}
