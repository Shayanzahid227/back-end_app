import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Assuming these are imports from your project structure
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';
import 'package:hustler_syn/screens/profile/referral_and_rewards/referral_and_reward_screen.dart';
// Local imports for this example

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Mock state variables
  bool pushNotifications = true;
  bool emailNotifications = false;
  bool newMessages = true;
  bool jobUpdates = true;
  bool paymentAlerts = false;
  bool promotionsTips = true;
  bool weeklyDigest = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: CustomAppBar(
        title: 'Notification',
        showBackButton: true,
        action: Text(''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('General'),
                CustomContainer(
                  children: [
                    _buildToggleItem(
                      title: 'Push Notifications',
                      subtitle: 'Receive push notifications on your device',
                      value: pushNotifications,
                      onChanged: (val) =>
                          setState(() => pushNotifications = val),
                    ),
                    _buildToggleItem(
                      title: 'Email Notifications',
                      subtitle: 'Receive notifications via email',
                      value: emailNotifications,
                      onChanged: (val) =>
                          setState(() => emailNotifications = val),
                      showDivider: false,
                    ),
                  ],
                ),
                _buildSectionTitle('Activity'),
                CustomContainer(
                  children: [
                    _buildToggleItem(
                      title: 'New Messages',
                      subtitle: 'When someone sends you a message',
                      value: newMessages,
                      onChanged: (val) => setState(() => newMessages = val),
                    ),
                    _buildToggleItem(
                      title: 'Job Updates',
                      subtitle: 'Updates on your posted or accepted jobs',
                      value: jobUpdates,
                      onChanged: (val) => setState(() => jobUpdates = val),
                    ),
                    _buildToggleItem(
                      title: 'Payment Alerts',
                      subtitle: 'Payment confirmations and invoices',
                      value: paymentAlerts,
                      onChanged: (val) => setState(() => paymentAlerts = val),
                      showDivider: false,
                    ),
                  ],
                ),
                _buildSectionTitle('Marketing'),
                CustomContainer(
                  children: [
                    _buildToggleItem(
                      title: 'Promotions & Tips',
                      subtitle: 'Special offers and platform updates',
                      value: promotionsTips,
                      onChanged: (val) => setState(() => promotionsTips = val),
                    ),
                    _buildToggleItem(
                      title: 'Weekly Digest',
                      subtitle: 'Summary of your weekly activity',
                      value: weeklyDigest,
                      onChanged: (val) => setState(() => weeklyDigest = val),
                      showDivider: false,
                    ),
                  ],
                ),
                40.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///. toggle
  ///

  Widget _buildToggleItem({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        SwitchListTile(
          value: value,
          onChanged: onChanged,
          activeColor: primaryColor,
          inactiveThumbColor: greyColor,
          inactiveTrackColor: backGroundColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
          tileColor: backGroundColor,
          title: Text(
            title,
            style: style14_600,
          ),
          subtitle: Text(
            subtitle,
            style: style14_400.copyWith(color: greyColor),
          ),
        ),
        if (showDivider)
          Container(
            height: 1.w,
            color: borderColor,
            margin: EdgeInsets.only(left: 15.w, right: 15.w),
          ),
      ],
    );
  }

  ///
  ///. section tile
  ///
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: style18_600.copyWith(),
    );
  }
}
