import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/discover_card.dart';
import 'package:hustler_syn/core/custom_widgets/discover_screen_tabs.dart';
import 'package:hustler_syn/core/enums/discover_screen.dart';
import 'package:hustler_syn/screens/discover/discover_view_model.dart';

import 'package:hustler_syn/screens/profile/main_profile/profile_screen.dart';
import 'package:hustler_syn/screens/profile/notification_screen/notification_screen.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DiscoverViewModel(),
      child: Consumer<DiscoverViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          backgroundColor: backGroundColor,
          appBar: AppBar(
            backgroundColor: backGroundColor,
            toolbarHeight: 100.h,
            leadingWidth: 75.w,
            leading: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: GestureDetector(
                onTap: () {
                  Get.to(ProfileScreen());
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AppAssets().profileIcon),
                ),
              ),
            ),
            title: Text(
              viewModel.getAppBarTitle(),
              style: style20_600.copyWith(color: Colors.white),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(NotificationScreen());
                      },
                      child: Container(
                        height: 30.h,
                        width: 27.w,
                        margin: EdgeInsets.only(top: 20.h),
                        child: Image(
                          image: AssetImage(AppAssets().notificationIcon),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15.h,
                      right: 0,
                      child: const Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                _buildSearchBar(context),
                SizedBox(height: 15.h),
                _buildCategoryTabs(viewModel),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    itemCount: viewModel.discoverList.length,
                    itemBuilder: (context, index) {
                      return CustomDiscoverCard(
                        model: viewModel.discoverList[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        height: 55.h,
        decoration: BoxDecoration(),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                  style: style14_400.copyWith(color: Colors.white),
                  decoration: customAuthField.copyWith(
                      prefixIcon: Image.asset(
                        AppAssets().searchIcon2,
                        color: whiteColor,
                        height: 20.h,
                        scale: 4,
                        width: 20.w,
                      ),
                      hintText: 'Find a Hustler / Service near you')),
            ),
            15.horizontalSpace,
            Container(
              height: 45.w,
              width: 45.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor)),
              child: Center(
                child: Image.asset(
                  AppAssets().locationIcon,
                  scale: 4,
                  height: 20.h,
                  width: 20.w,
                  color: whiteColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTabs(DiscoverViewModel viewModel) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: DiscoverCategory.values.map((category) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: CategoryTab(
              category: category,
              isSelected: viewModel.selectedCategory == category,
              onTap: () => viewModel.selectCategory(category),
            ),
          );
        }).toList(),
      ),
    );
  }
}
