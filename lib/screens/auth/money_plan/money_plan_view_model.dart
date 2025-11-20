import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/screens/auth/money_plan/money_plan_screen.dart';
import 'package:hustler_syn/screens/auth/money_plan/money_plan_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hustler_syn/core/base_view_model/base_view_model.dart';

enum PlanType { monthly, annual }

class Plan {
  final PlanType type;
  final String title;
  final String price;
  final String billingCycle;
  final String saveText;
  final List<String> features;
  final bool isFeatured;

  Plan({
    required this.type,
    required this.title,
    required this.price,
    required this.billingCycle,
    required this.features,
    this.saveText = '',
    this.isFeatured = false,
  });

  Plan copyWith({bool? isFeatured}) {
    return Plan(
      type: type,
      title: title,
      price: price,
      billingCycle: billingCycle,
      features: features,
      saveText: saveText,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }
}

class MoneyPlanViewModel extends BaseViewModel {
  PlanType _selectedTab = PlanType.monthly;
  int _selectedPlanIndex =
      0; // Index 0 for Monthly/Annual Plan, Index 1 for the second plan if applicable

  PlanType get selectedTab => _selectedTab;
  int get selectedPlanIndex => _selectedPlanIndex;

  late final List<Plan> _monthlyPlans;
  late final List<Plan> _annualPlans;

  MoneyPlanViewModel() {
    // Define plan data based on the provided images
    _monthlyPlans = [
      Plan(
        type: PlanType.monthly,
        title: 'Monthly Plan',
        price: r'$8.99',
        billingCycle: '/Month',
        features: const [
          'Access all services',
          'Book hustlers instantly',
          'Priority support',
          'Advanced analytics dashboard',
          'Custom profile customization',
        ],
        isFeatured: true,
      ),
      // Add more monthly plans if needed for structure
    ];

    _annualPlans = [
      Plan(
        type: PlanType.annual,
        title: 'Annual Plan',
        price: r'$95.99',
        billingCycle: '/Year',
        saveText:
            '2 months free', // Based on $95.99/yr vs $8.99/mo * 12 = $107.88
        features: const [
          'Everything in Monthly Plan',
          '2 months free',
          'Priority customer support',
          'Early access to new features',
          'Advanced analytics dashboard',
          'Custom profile customization',
        ],
        isFeatured: true,
      ),
      // Add more annual plans if needed for structure
    ];
  }

  List<Plan> get currentPlans =>
      _selectedTab == PlanType.monthly ? _monthlyPlans : _annualPlans;

  Plan get selectedPlan => currentPlans[_selectedPlanIndex];

  void selectTab(PlanType type) {
    if (_selectedTab != type) {
      _selectedTab = type;
      // Reset selected plan index when switching tabs, assuming the plan list is consistent
      _selectedPlanIndex = 0;
      notifyListeners();
    }
  }

  void selectPlan(int index) {
    if (_selectedPlanIndex != index) {
      _selectedPlanIndex = index;
      notifyListeners();
    }
  }

  Future<void> showSubscriptionPopup(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => SubscriptionDetailsPopup(plan: selectedPlan),
    );
  }
}
