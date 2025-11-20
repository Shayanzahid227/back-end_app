import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/screens/chat/chat_screen.dart';
import 'package:hustler_syn/screens/chat/chat_view_model.dart';
import 'package:hustler_syn/screens/discover/discover_screen.dart';
import 'package:hustler_syn/screens/home/home_screen.dart';
import 'package:hustler_syn/screens/post/all_post_screen.dart';
import 'package:hustler_syn/screens/post/create_post_screen.dart';
import 'package:hustler_syn/screens/profile/main_profile/profile_screen.dart';
import 'package:hustler_syn/screens/root_screen/root_view_model.dart';
import 'package:provider/provider.dart';

// Placeholder screen for each tab content
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.w700,
          color: primaryColor,
        ),
      ),
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  static final List<Widget> _screens = [
    Home(),
    DiscoverScreen(),
    AllPostScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  static final List<Map<String, dynamic>> _navItems = [
    {'label': 'Home', 'icon': AppAssets().homeIcon2},
    {'label': 'Discover', 'icon': AppAssets().searchIcon2},
    {'label': 'Post', 'icon': AppAssets().postIcon2},
    {'label': 'Chat', 'icon': AppAssets().chatIcon},
    {'label': 'Profile', 'icon': AppAssets().profileIcon},
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootViewModel(),
      child: Consumer<RootViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backGroundColor,
          body: _screens[model.currentIndex],
          bottomNavigationBar: _CustomBottomNavigationBar(
            model: model,
            navItems: _navItems,
          ),
        ),
      ),
    );
  }
}

class _CustomBottomNavigationBar extends StatelessWidget {
  final RootViewModel model;
  final List<Map<String, dynamic>> navItems;

  const _CustomBottomNavigationBar(
      {required this.model, required this.navItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
          color: planCardColor,
          boxShadow: [
            BoxShadow(
              color: backGroundColor.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
          border: Border.all(color: borderColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navItems.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> item = entry.value;
          bool isSelected = model.currentIndex == index;

          return Expanded(
            child: InkWell(
              onTap: () => model.setIndex(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(item['icon']),
                    width: 24.w,
                    height: 24.h,
                    color: isSelected ? primaryColor : greyColor,
                  ),
                  5.verticalSpace,
                  Text(
                    item['label'],
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? primaryColor : greyColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
