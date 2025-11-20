import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Assuming these are imports from your project structure
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';

class PrivacyTermsScreen extends StatefulWidget {
  const PrivacyTermsScreen({super.key});

  @override
  State<PrivacyTermsScreen> createState() => _PrivacyTermsScreenState();
}

class _PrivacyTermsScreenState extends State<PrivacyTermsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildContentSection(
      {required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: style16_600,
        ),
        10.verticalSpace,
        Text(
          content,
          style: style14_400.copyWith(color: greyColor, height: 1.5),
        ),
        20.verticalSpace,
      ],
    );
  }

  Widget _buildPrivacyPolicyContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContentSection(
            title: 'What Data We Collect',
            content:
                'We collect information you provide directly to us such as when you create an account, post a service, or communicate with other users. This includes your name, email address, phone number, profile picture, and payment information.',
          ),
          _buildContentSection(
            title: 'How We Use Your Data',
            content:
                'We use the information we collect to provide, maintain, and improve our services, including to facilitate transactions between clients and service providers (Hustlers). Your data helps us personalize your experience, process transactions, send you updates and notifications, and ensure the security and integrity of our platform.',
          ),
          _buildContentSection(
            title: 'User Rights',
            content:
                'You have the right to access, update, or delete your personal information at any time through your account settings. You may also opt out of marketing communications and request a copy of your data. For any privacy concerns, please contact our support team.',
          ),
          _buildContentSection(
            title: 'Security Measures',
            content:
                'We implement industry-standard security measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the internet is 100% secure, and we cannot guarantee absolute security of your data.',
          ),
          _buildContentSection(
            title: 'Contact Information',
            content:
                'If you have any questions about this Privacy Policy or our data practices, please contact us at privacy@hustlersyn.com or through the in-app support feature.',
          ),
          30.verticalSpace,
          Center(
            child: Text(
              '© 2025 Hustler_Sync. All rights reserved.',
              style: style12_500.copyWith(color: greyColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTermsConditionsContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContentSection(
            title: 'User Responsibilities',
            content:
                'As a user of our platform, you agree to provide accurate and truthful information in your profile and service listings. You are responsible for maintaining the confidentiality of your account credentials. Clients and Hustlers must communicate respectfully and professionally. Any abuse, harassing, or fraudulent behavior will result in immediate account suspension.',
          ),
          _buildContentSection(
            title: 'Payments & Refunds',
            content:
                'All payments are processed securely through our platform. Service fees and commission rates are clearly displayed before any transaction is confirmed. Refund requests must be submitted within 48 hours of service completion and will be reviewed on a case-by-case basis. Disputes should be reported through our mediation center.',
          ),
          _buildContentSection(
            title: 'Prohibited Activities',
            content:
                'Prohibited are all activities using the platform for illegal activities, spam, or any form of exploitation. This includes but is not limited to: fraud, identity theft, and unauthorized use of intellectual property.',
          ),
          _buildContentSection(
            title: 'Account Suspension',
            content:
                'We reserve the right to suspend or terminate accounts that violate these Terms & Conditions, infringe on others\' rights, or receive multiple negative reports from other users. Users will be notified of account suspension via email and may appeal the decision within 14 days by contacting our support team.',
          ),
          _buildContentSection(
            title: 'Governing Law',
            content:
                'These Terms & Conditions are governed by and construed in accordance with the laws of the jurisdiction in which our company is registered. Any disputes arising from these terms will be resolved through binding arbitration in accordance with applicable arbitration rules.',
          ),
          30.verticalSpace,
          Center(
            child: Text(
              '© 2025 Hustler_Sync. All rights reserved.',
              style: style12_500.copyWith(color: greyColor),
            ),
          ),
        ],
      ),
    );
  }

  // Custom widget to create the button-like segmented tab
  Widget _buildSegmentedControl() {
    return AnimatedBuilder(
      animation: _tabController,
      builder: (context, child) {
        final currentIndex = _tabController.index;
        return Row(
          children: [
            _buildSegment('Privacy Policy', 0, currentIndex),
            _buildSegment('Terms & Conditions', 1, currentIndex),
          ],
        );
      },
    );
  }

  Widget _buildSegment(String title, int index, int currentIndex) {
    final bool isSelected = index == currentIndex;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _tabController.animateTo(index);
        },
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected ? primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: borderColor)),
          child: Text(
            title,
            style: style14_500.copyWith(
              color: isSelected ? backGroundColor : whiteColor,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: CustomAppBar(
        title: 'Privacy & Terms',
        showBackButton: true,
      ),
      body: Column(
        children: [
          // Custom Segmented Control replaces the TabBar
          _buildSegmentedControl(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPrivacyPolicyContent(),
                _buildTermsConditionsContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
