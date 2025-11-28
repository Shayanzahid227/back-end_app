import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/action_button.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';
import 'package:hustler_syn/core/custom_widgets/post_card.dart';
import 'package:hustler_syn/core/custom_widgets/profile_card.dart';
import 'package:hustler_syn/core/model/profile_model.dart';
import 'package:hustler_syn/core/model/service_price_model.dart';

import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hustler_syn/screens/home/home_screen_view_model.dart';
import 'package:hustler_syn/screens/post/create_post_screen.dart';
import 'package:hustler_syn/screens/profile/main_profile/profile_screen.dart';
import 'package:hustler_syn/screens/profile/notification_screen/notification_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //

    return ChangeNotifierProvider(
      create: (context) => HomeScreenViewModel(),
      child: Consumer<HomeScreenViewModel>(
        builder: (context, model, child) => Scaffold(
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
                  backgroundImage: AssetImage(AppAssets().boys),
                ),
              ),
            ),
            title: Text(
              'HomeScreen',
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
          body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            itemCount: model.allPosts.length,
            itemBuilder: (context, index) {
              return PostCard(post: model.allPosts[index]);
            },
          ),
        ),
      ),
    );
  }
}
