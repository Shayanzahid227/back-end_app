// Container for Tab Bar and Auth Screens
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/screens/auth/main_auth_screen/login/login_screen.dart';
import 'package:hustler_syn/screens/auth/main_auth_screen/sign_up/sign_up_screen.dart';
import 'package:hustler_syn/screens/on_boarding/on_boarding_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              // Logo, Title, Subtitle
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Image.asset(
                      AppAssets().splashIcon,
                      scale: 4,
                      height: 145.h,
                    ),
                    20.verticalSpace,
                    Text(
                      'Welcome to HustlerSync',
                      style: style25_600.copyWith(fontSize: 28.sp),
                    ),
                    const SizedBox(height: 4),
                    Text('Sign in to continue', style: style14_400.copyWith()),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: lightBackGroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10,
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerHeight: 0,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // keep corners clean
                        color: backGroundColor,
                      ),
                      indicatorColor: Colors.transparent,
                      labelColor: whiteColor,
                      unselectedLabelColor: greyColor,

                      labelStyle: style16_600.copyWith(color: whiteColor),
                      tabs: const [
                        Tab(text: 'Login'),
                        Tab(text: 'Sign Up'),
                      ],
                    ),
                  ),
                ),
              ),

              // Tab Bar View (Content)
              Expanded(
                child: TabBarView(children: [LoginScreen(), SignUpScreen()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
