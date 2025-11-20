import 'package:flutter/material.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/screens/auth/main_auth_screen/main_auth_screen.dart';

class OnboardingViewModel extends ChangeNotifier {
  late PageController _pageController;
  int _currentPageIndex = 0;

  final List<OnboardingItem> _pages = [
    OnboardingItem(
      image: AppAssets().bagIcon,
      title: 'Hire Hustlers',
      subtitle:
          'Find skilled professionals for any job, from repairs to creative work',
    ),
    OnboardingItem(
      image: AppAssets().locationIcon,
      title: 'Find Nearby Services',
      subtitle: 'Discover local Hustlers ready to help in your area',
    ),
    OnboardingItem(
      image: AppAssets().dollarIcon,
      title: 'Earn Money by Working',
      subtitle: 'Become a hustler and monetize your skills on your own terms',
    ),
  ];

  OnboardingViewModel() {
    _pageController = PageController();
  }

  // Getters for View to consume
  PageController get pageController => _pageController;
  List<OnboardingItem> get pages => _pages;
  int get currentPageIndex => _currentPageIndex;
  bool get isLastPage => _currentPageIndex == _pages.length - 1;

  void onPageChanged(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  /// Handles the 'Next' button tap.
  void nextPage(BuildContext context) {
    if (isLastPage) {
      _completeOnboarding(context);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  /// Handles the 'Skip' button tap.
  void skipOnboarding(BuildContext context) {
    _completeOnboarding(context);
  }

  /// Navigates to the next screen (LoginScreen in this case).
  void _completeOnboarding(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const AuthScreen()),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

// model
class OnboardingItem {
  final String image;
  final String title;
  final String subtitle;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
