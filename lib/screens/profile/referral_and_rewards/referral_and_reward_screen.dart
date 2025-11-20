import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';
import 'package:hustler_syn/main.dart';
import 'package:hustler_syn/screens/profile/referral_and_rewards/referral_and_reward_view_model.dart';
import 'package:provider/provider.dart';

class ReferralAndRewardScreen extends StatelessWidget {
  const ReferralAndRewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReferralAndRewardViewModel(),
      child: Consumer<ReferralAndRewardViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: CustomAppBar(
            title: 'Referral & Rewards',
            showBackButton: true,
            action: Icon(
              Icons.abc,
              color: backGroundColor,
            ),
            centerTitle: true,
          ),
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
                  ///. first container
                  ///
                  CustomContainer(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Image.asset(
                              AppAssets().giftIcon,
                              scale: 4,
                            ),
                            10.verticalSpace,
                            Text(
                              'Your Referral Code',
                              style: style18B,
                            ),
                            10.verticalSpace,
                            Text(
                              textAlign: TextAlign.center,
                              'Share your code and earn rewards when friends\njoin',
                              style: style14_400.copyWith(color: greyColor),
                            ),
                            10.verticalSpace,
                            InkWell(
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Center(
                                  child: Text(
                                    'JOHN2024',
                                    style: style14B.copyWith(
                                        fontSize: 30.sp,
                                        color: backGroundColor),
                                  ),
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        border: Border.all(
                                          color: borderColor,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            AppAssets().copyIcon,
                                            scale: 4,
                                            color: whiteColor,
                                          ),
                                          10.horizontalSpace,
                                          Text(
                                            'Copy Code',
                                            style: style14_600,
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            AppAssets().shareIcon2,
                                            scale: 4,
                                            color: backGroundColor,
                                          ),
                                          10.horizontalSpace,
                                          Text(
                                            'Share',
                                            style: style14_600.copyWith(
                                                color: backGroundColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )

                  ///
                  /// row of two container
                  ///
                  ,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: borderColor,
                              ),
                              borderRadius: BorderRadius.circular(17.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '5',
                                style: style25B.copyWith(fontSize: 29.sp),
                              ),
                              8.verticalSpace,
                              Text(
                                'Referrals',
                                style: style16_400,
                              )
                            ],
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: borderColor,
                              ),
                              borderRadius: BorderRadius.circular(17.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'R1080',
                                style: style25B.copyWith(
                                    fontSize: 29.sp, color: primaryColor),
                              ),
                              8.verticalSpace,
                              Text(
                                'Earned',
                                style: style16_400.copyWith(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )

                  ///
                  ///. top 3 referees section
                  ///
                  ,
                  10.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.currency_bitcoin,
                        color: primaryColor,
                      ),
                      8.horizontalSpace,
                      Text(
                        'Top 3 Referees',
                        style: style20_600.copyWith(),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color(0xff8C630).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(999.r)),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20.h,
                                width: 20.w,
                                child: Image.asset(
                                  AppAssets().giftIcon2,
                                  scale: 4,
                                  color: Color(0xffF8C630),
                                ),
                              ),
                              Text(
                                '#1 Wins a Gift!',
                                style: style12_600.copyWith(
                                  color: Color(0xffF8C630),
                                ),
                              ),
                              10.verticalSpace,
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  10.verticalSpace,
                  buildSettingItem(
                      image: AppAssets().rank1Icon,
                      title: 'Emma R.',
                      subtitle: 'Referral',
                      trailing: '#1'),

                  buildSettingItem(
                      image: AppAssets().rank1Icon,
                      title: 'Micheal T.',
                      subtitle: '18 referrals',
                      trailing: '#2'),
                  buildSettingItem(
                      image: AppAssets().rank1Icon,
                      title: 'Sarah K.',
                      subtitle: '15 referrals',
                      trailing: '#3'),

                  buildSettingItem(
                      image: AppAssets().rank1Icon,
                      title: 'Micheal T.',
                      subtitle: '18 referrals',
                      trailing: '#2'),
                  5.verticalSpace,
                  Text(
                    'Keep sharing to climb the leaderboard!',
                    style: style12_500.copyWith(fontWeight: FontWeight.w400),
                  ),
                  10.verticalSpace,
                  CustomContainer(children: [
                    Text(
                      'How It Works',
                      style: style16_600,
                    ),
                    10.verticalSpace,
                    builtWorkFlow(
                        image: AppAssets().oneIcon,
                        title: 'Share Your Code',
                        subtitle: 'Send your referral code to friends'),
                    10.verticalSpace,
                    builtWorkFlow(
                        image: AppAssets().oneIcon,
                        title: 'They Sign Up',
                        subtitle: 'Friends create an account using your code'),
                    10.verticalSpace,
                    builtWorkFlow(
                        image: AppAssets().oneIcon,
                        title: 'Earn Rewards',
                        subtitle:
                            'Get €10 credit for each successful referral'),
                  ]),
                  10.verticalSpace,
                  CustomContainer(children: [
                    Text(
                      'Recent Referrals',
                      style: style16_600,
                    ),
                    10.verticalSpace,
                    Text(
                      'Sarah M.',
                      style: style16_600,
                    ),
                    8.verticalSpace,
                    Text(
                      '2 days ago',
                      style: style14_400,
                    ),
                    Divider(
                      color: borderColor,
                    ),
                    Text(
                      'Milk k.',
                      style: style16_600,
                    ),
                    8.verticalSpace,
                    Text(
                      '1 weeks ago',
                      style: style14_400,
                    ),
                    Divider(
                      color: borderColor,
                    ),
                    Text(
                      'Lisa T.',
                      style: style16_600,
                    ),
                    8.verticalSpace,
                    Text(
                      '2 weeks ago',
                      style: style14_400,
                    ),
                  ]),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  ///
  ///. custom widget for each row
  ///
  Widget buildSettingItem({
    required String image,
    required String title,
    required String subtitle,
    required String trailing,
    Color? itemBackgroundColor,
    VoidCallback? onTap,
  }) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor)),
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: Image.asset(
                    image,
                    scale: 4,
                  )),
              title: Text(
                title,
                style: style16_600,
              ),
              subtitle: Text(
                subtitle,
                style: style14_400.copyWith(color: greyColor),
              ),
              trailing: Text(
                trailing,
                style: style25_400.copyWith(
                    fontWeight: FontWeight.w700, color: primaryColor),
              ),
              onTap: onTap,
            ),
          ],
        ));
  }

  ///
  ///. work flow
  ///
  Widget builtWorkFlow({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      leading: SizedBox(
          height: 50.h,
          width: 50.w,
          child: Image.asset(
            image,
            scale: 4,
          )),
      title: Text(
        title,
        style: style16_600,
      ),
      subtitle: Text(
        subtitle,
        style: style14_400.copyWith(color: greyColor),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final List<Widget> children;
  final double? verticalMargin;
  final Color? backGroundColor;

  const CustomContainer({
    required this.children,
    this.verticalMargin,
    this.backGroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: EdgeInsets.symmetric(vertical: verticalMargin ?? 15),
      decoration: BoxDecoration(
        color: backGroundColor ?? backColor2,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      ),
    );
  }
}
