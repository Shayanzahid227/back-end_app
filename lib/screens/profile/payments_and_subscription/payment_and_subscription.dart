import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
// Assuming these imports define your color and style variables
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';
import 'package:hustler_syn/core/custom_widgets/custom_button.dart';

class PaymentSubscriptionScreen extends StatelessWidget {
  const PaymentSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Assuming backGroundColor, secondaryColor, primaryColor, whiteColor, etc., are globally available or imported from 'colors.dart'

    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: CustomAppBar(
        title: 'Payments & Subscription',
        showBackButton: true,
        action: Icon(
          Icons.safety_check,
          color: backGroundColor,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPlanCard(),
              SizedBox(height: 25.h),
              _buildPaymentMethodSection(),
              SizedBox(height: 25.h),
              _buildBillingHistorySection(),
              SizedBox(height: 25.h),
              _buildPlanIncludesSection(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardContainer({required Widget child, EdgeInsets? padding}) {
    return Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: backGroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: child,
    );
  }

  Widget _buildPlanCard() {
    return _buildCardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pro Plan',
                style: style18_600.copyWith(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Text(
                  'Active',
                  style: style12_500.copyWith(color: backGroundColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            'Full access to all features',
            style: style14_400.copyWith(),
          ),
          SizedBox(height: 15.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '€29',
                style: style25B.copyWith(fontSize: 30.sp),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, bottom: 4.h),
                child: Text(
                  '/month',
                  style: style16_400.copyWith(color: greyColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 14.w, color: whiteColor),
              SizedBox(width: 8.w),
              Text(
                'Renews on December 12, 2025',
                style: style14_400.copyWith(),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomButton(text: 'Change Plan', onTap: () {}),
          SizedBox(height: 10.h),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Cancel Subscription',
                style: style14_500.copyWith(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        ),
        _buildCardContainer(
          padding: EdgeInsets.all(10.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Method',
                    style: style18_600.copyWith(color: whiteColor),
                  ),
                  Text(
                    'Edit',
                    style: style14_500.copyWith(color: primaryColor),
                  ),
                ],
              ),
              10.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: darkGreyColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade800,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color(0xff2563EB),
                          Color(0xff60A5FA)
                        ])),
                        width: 48,
                        height: 32.h,
                        child: Icon(Icons.credit_card,
                            color: whiteColor, size: 18.w),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '•••• •••• •••• 4242',
                          style: style16_600.copyWith(color: whiteColor),
                        ),
                        Text(
                          'Expires 12/25',
                          style: style14_400.copyWith(color: Color(0xffD6D6D6)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              CustomButton(
                text: "Add Payment Method",
                onTap: () {},
                textColor: whiteColor,
                borderColor: borderColor,
                gradientColors: [backGroundColor, backGroundColor],
              ),
              10.verticalSpace
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBillingHistorySection() {
    final List<Map<String, String>> history = [
      {'date': 'Nov 12, 2024', 'amount': 'R99.99'},
      {'date': 'Oct 12, 2024', 'amount': 'R99.99'},
      {'date': 'Sep 12, 2024', 'amount': 'R99.99'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCardContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Billing History',
                style: style18_600.copyWith(color: whiteColor),
              ),
              10.verticalSpace,
              ...history
                  .map((item) =>
                      _buildBillingItem(item['date']!, item['amount']!))
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBillingItem(String date, String amount) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: style16_600.copyWith(color: whiteColor),
                    ),
                    Text(
                      'Paid',
                      style: style14_400.copyWith(color: greyColor),
                    ),
                  ],
                ),
              ),
              Text(
                amount,
                style: style16_600.copyWith(color: whiteColor),
              ),
              SizedBox(width: 15.w),
              Icon(Icons.file_download_outlined, color: whiteColor, size: 24.w),
            ],
          ),
          10.verticalSpace,
          Container(
            width: double.infinity,
            color: borderColor,
            height: 1,
          ),
          10.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildPlanIncludesSection() {
    final List<String> features = [
      'Unlimited job postings',
      'Priority customer support',
      'Advanced analytics dashboard',
      'Verified badge on profile',
      'Featured in search results',
      'Direct messaging with clients',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCardContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Plan Includes',
                style: style16_600.copyWith(),
              ),
              10.verticalSpace,
              ...features.map((feature) => _buildFeatureItem(feature)).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Image.asset(
            AppAssets().colorChickIcon2,
            scale: 4,
          ),
          SizedBox(width: 10.w),
          Text(
            text,
            style: style16_400.copyWith(color: whiteColor),
          ),
        ],
      ),
    );
  }
}
