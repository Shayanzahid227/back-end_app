import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/screens/on_boarding/on_boarding_view_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late OnboardingViewModel _viewModel;

  // Initialize ViewModel and set up listener for state updates
  @override
  void initState() {
    super.initState();
    _viewModel = OnboardingViewModel();
    // Listen to ViewModel changes and trigger a build when notifyListeners is called
    _viewModel.addListener(_onViewModelChange);
  }

  void _onViewModelChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _viewModel.removeListener(_onViewModelChange);
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLastPage = _viewModel.isLastPage;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // The PageView content
            Expanded(
              child: PageView.builder(
                controller: _viewModel.pageController,
                itemCount: _viewModel.pages.length,
                onPageChanged: _viewModel.onPageChanged,
                itemBuilder: (context, index) {
                  final page = _viewModel.pages[index];
                  return _OnboardingPageContent(page: page);
                },
              ),
            ),

            // Pagination Dots
            _PaginationDots(
              count: _viewModel.pages.length,
              activeIndex: _viewModel.currentPageIndex,
              activeColor: primaryColor,
              inactiveColor: theme.primaryColor.withOpacity(0.3),
            ),

            const SizedBox(height: 32),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // Primary Button (Next / Get Started)
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => _viewModel.nextPage(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        isLastPage ? 'Get Started' : 'Next',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: backGroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Secondary Button (Skip)
                  TextButton(
                    onPressed: isLastPage
                        ? null
                        : () => _viewModel.skipOnboarding(context),
                    child: Text(
                      'Skip',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: isLastPage ? transparentColor : greyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// --- Helper Widgets for Cleaner UI Structure ---

class _OnboardingPageContent extends StatelessWidget {
  final OnboardingItem page;

  const _OnboardingPageContent({required this.page});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Icon
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: theme.primaryColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Image.asset(page.image, color: primaryColor, scale: 4),
          ),

          30.verticalSpace,

          // Title
          Text(
            page.title,
            textAlign: TextAlign.center,
            style: style12_500.copyWith(
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 16),

          // Subtitle
          Text(
            page.subtitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: whiteColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _PaginationDots extends StatelessWidget {
  final int count;
  final int activeIndex;
  final Color activeColor;
  final Color inactiveColor;

  const _PaginationDots({
    required this.count,
    required this.activeIndex,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        bool isActive = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 8.0,
          width: isActive ? 32.0 : 8.0,
          decoration: BoxDecoration(
            color: isActive ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
