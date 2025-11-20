import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/custom_button.dart';
import 'package:hustler_syn/screens/auth/money_plan/money_plan_view_model.dart';
import 'package:hustler_syn/screens/root_screen/root_screen.dart';
import 'package:provider/provider.dart';

class MoneyPlanScreen extends StatelessWidget {
  const MoneyPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoneyPlanViewModel(),
      child: Consumer<MoneyPlanViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backGroundColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    50.verticalSpace,

                    ///
                    ///. top logo and header text
                    ///
                    Center(
                      child: Column(
                        children: [
                          // Assuming AppAssets().splashIcon points to the logo image
                          Image.asset(
                            AppAssets().splashIcon,
                            height: 145.h,
                          ),
                          20.verticalSpace,
                          Text(
                            'Choose Your Plan',
                            style: style25_600.copyWith(fontSize: 32.sp),
                          ),
                          5.verticalSpace,
                          Text(
                            'Start with a 7-day free trial. Cancel anytime.',
                            style: style16_400.copyWith(color: greyColor),
                          ),
                        ],
                      ),
                    ),
                    30.verticalSpace,

                    ///
                    ///. progress bar section (Re-used existing progress bar logic)
                    ///
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Step 2 of 2',
                          style: style18_600.copyWith(
                              color: greyColor, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "100%",
                          style: style18_600.copyWith(
                              color: greyColor, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),

                    ///
                    ///. progress bar
                    ///
                    Container(
                      width: double.infinity,
                      height: 15.h,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: borderColor)),
                    ),

                    30.verticalSpace,

                    ///
                    ///. Plan TabBar
                    ///
                    Container(
                      decoration: BoxDecoration(
                          color: backGroundColor,
                          border: Border.all(color: borderColor),
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _PlanTabBar(model: model),

                            30.verticalSpace,

                            ///
                            ///. Conditional Plan UI
                            ///
                            _PlanCard(
                              plan: model.selectedPlan,
                              onSubscribe: () =>
                                  model.showSubscriptionPopup(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    20.verticalSpace,

                    ///
                    ///. second container showing '7-Day Free Trial' text
                    ///
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: freeTrailPlanBoxColor,
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '7-Day Free Trial',
                            style: style18_600,
                          ),
                          8.verticalSpace,
                          Text(
                            textAlign: TextAlign.center,
                            'Try all premium features free for 7 days. No\ncredit card required to start.',
                            style: style14_400,
                          ),
                        ],
                      ),
                    ),
                    20.verticalSpace,

                    ///
                    ///. start free trail button
                    ///
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 40,
                      ),
                      child: CustomButton(
                          textColor: backGroundColor,
                          text: 'Start Free Trail',
                          onTap: () {}),
                    ),
                    20.verticalSpace,

                    ///
                    ///. skip button
                    ///
                    TextButton(
                        onPressed: () {
                          Get.offAll(RootScreen());
                        },
                        child: Text(
                          'Skip for now',
                          style: style14_600,
                        )),
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

///
///. plan tab bar
///
class _PlanTabBar extends StatelessWidget {
  final MoneyPlanViewModel model;
  const _PlanTabBar({required this.model});

  @override
  Widget build(BuildContext context) {
    final isMonthlySelected = model.selectedTab == PlanType.monthly;

    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: planTabBarBackColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          if (!isMonthlySelected)
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.all(5.w),
                  width: (MediaQuery.of(context).size.width - 48.w - 8.w) / 2,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
          if (isMonthlySelected)
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.all(5.0.w),
                  width: (MediaQuery.of(context).size.width - 48.w - 8.w) / 2,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => model.selectTab(PlanType.monthly),
                  child: Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Monthly',
                      style: style16_600.copyWith(
                        color: isMonthlySelected ? backGroundColor : whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => model.selectTab(PlanType.annual),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          'Annual',
                          style: style16_600.copyWith(
                            color: !isMonthlySelected
                                ? backGroundColor
                                : greyColor,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.h,
                        right: 0.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: backGroundColor),
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(9999.r),
                          ),
                          child: Text(
                            'Save 20%',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                color: backGroundColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

///
/// plan card
///
class _PlanCard extends StatelessWidget {
  final Plan plan;
  final VoidCallback onSubscribe;

  const _PlanCard({required this.plan, required this.onSubscribe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSubscribe,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: planCardColor,
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plan.title,
              style: style25_600.copyWith(
                fontSize: 24.sp,
              ),
            ),
            15.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(plan.price,
                    style:
                        style25B.copyWith(color: whiteColor, fontSize: 38.sp)),
                Text(
                  plan.billingCycle,
                  style: style16_400.copyWith(color: greyColor, height: 2.5),
                ),
              ],
            ),
            if (plan.saveText.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text(
                  plan.saveText,
                  style: style14_400.copyWith(color: primaryColor),
                ),
              ),

            20.verticalSpace,

            // Features List
            ...plan.features
                .map((feature) => Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.check_sharp,
                              color: primaryColor, size: 20.w),
                          10.horizontalSpace,
                          Expanded(
                            child: Text(
                              feature,
                              style: style16_400,
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),

            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

///
///  money plan popUp
///

class SubscriptionDetailsPopup extends StatelessWidget {
  final Plan plan;

  const SubscriptionDetailsPopup({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    final isAnnual = plan.type == PlanType.annual;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: planPopUpBackColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            40.verticalSpace,

            Text('Choose Your Subscription',
                style: style25B.copyWith(fontSize: 30)),
            20.verticalSpace,
            Text(
              'Access exclusive features for just one yearly fee.',
              style: style14_400.copyWith(),
            ),

            20.verticalSpace,

            // Selected Plan Card (Simplified)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor),
                color: planCardColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Center(
                    child: Image(
                      image: AssetImage(
                        AppAssets().colorAddIcon,
                      ),
                      height: 65.h,
                      width: 65.w,
                    ),
                  ),
                  20.horizontalSpace,
                  Center(
                    child: Text(
                      isAnnual ? 'Annual Subscription' : 'Monthly Subscription',
                      style: style18_600,
                    ),
                  ),
                  15.verticalSpace,
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(plan.price,
                            style: style14B.copyWith(
                                color: primaryColor, fontSize: 48.sp)),
                        Text(
                          plan.billingCycle,
                          style: style16_400.copyWith(height: 2.5),
                        ),
                      ],
                    ),
                  ),
                  5.verticalSpace,
                  Center(
                    child: Text(
                      isAnnual ? 'Billed annually' : 'Billed monthly',
                      style: style14_400.copyWith(),
                    ),
                  ),
                  20.verticalSpace,
                  ...plan.features
                      .map((feature) => Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppAssets().colorChickIcon,
                                  scale: 4,
                                  height: 25.h,
                                  width: 25.w,
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: Text(
                                    feature,
                                    style: style16_400,
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                  20.verticalSpace,
                  30.verticalSpace,

                  // Subscribe Button
                  CustomButton(
                      textColor: backGroundColor,
                      text: 'Subscribe Now',
                      onTap: () {
                        Get.back();
                      }),

                  30.verticalSpace,
                ],
              ),
            ),

            // Features

            15.verticalSpace,

            Center(
              child: Text(
                'Subscription renews automatically every year.\nYou can cancel anytime in settings.',
                textAlign: TextAlign.center,
                style: style14_400.copyWith(),
              ),
            ),
            40.verticalSpace
          ],
        ),
      ),
    );
  }
}
