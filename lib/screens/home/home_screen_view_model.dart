import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hustler_syn/core/base_view_model/base_view_model.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/model/profile_model.dart';
import 'package:hustler_syn/core/model/service_price_model.dart';

class HomeScreenViewModel extends BaseViewModel {
  int currentIndex = 0;

  final List<ProfileModel> profiles = [
    ProfileModel(
        id: '1',
        image: AppAssets().boys,
        name: "Sarah Johnson",
        role: "Professional Cleaner",
        rating: 4.8,
        distance: "3.2 km",
        tags: [
          "Emergency Repairs",
          "Installation",
          "Maintenance"
        ],
        servicePrices: [
          ServicePrice(
            serviceName: "Basic Cleaning",
            price: "R400",
            description:
                "Standard cleaning of living\nareas, bedrooms, kitchen, and\nbathrooms",
            duration: "Duration: 3-7 hours",
          ),
          ServicePrice(
            serviceName: "Deep Cleaning",
            price: "R500",
            description:
                "Thorough cleaning including\nbaseboards, windows, and\nhard-to-reach areas",
            duration: "Duration: 4-19 hours",
          ),
          ServicePrice(
            serviceName: "Move-Out Cleaning",
            price: "R250",
            description: "Complete property cleaning\nfor moving purposes",
            duration: "Duration: 1-3 hours",
          ),
        ]),
    ProfileModel(
        image: AppAssets().userImage,
        name: "Mike Peters",
        role: "Handyman Service",
        rating: 4.5,
        distance: "1.3 km",
        tags: [
          "Plumbing",
          "Maintenance",
          "Installation"
        ],
        servicePrices: [
          ServicePrice(
            serviceName: "Leak Repair",
            price: "75.0",
            description: "Fixing minor leaks in faucets and pipes.",
            duration: "Duration: 2-7 hours",
          ),
          ServicePrice(
            serviceName: "Fixture Installation",
            price: "120.0",
            description: "Installing sinks, toilets, and other fixtures.",
            duration: "Duration: 2-3 hours",
          ),
        ]),
    ProfileModel(
        image: AppAssets().boys,
        name: "John Doe",
        role: "Electrician",
        rating: 4.9,
        distance: "0.8 km",
        tags: [
          "Wiring",
          "Emergency Fix",
          "Installation"
        ],
        servicePrices: [
          ServicePrice(
            serviceName: "Basic Cleaning",
            price: "R400",
            description:
                "Standard cleaning of living\nareas, bedrooms, kitchen, and\nbathrooms",
            duration: "Duration: 6-10 hours",
          ),
          ServicePrice(
            serviceName: "Deep Cleaning",
            price: "R500",
            description:
                "Thorough cleaning including\nbaseboards, windows, and\nhard-to-reach areas",
            duration: "Duration: 5-8 hours",
          ),
          ServicePrice(
            serviceName: "Move-Out Cleaning",
            price: "R250",
            description: "Complete property cleaning\nfor moving purposes",
            duration: "Duration: 5-9 hours",
          ),
        ]),
  ];

  void nextProfile() {
    if (currentIndex < profiles.length - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }
    notifyListeners();
  }

  void favoriteProfile() {
    if (kDebugMode) {
      print("Favorited: ${profiles[currentIndex].name}");
    }
    nextProfile();
    Get.snackbar(
      "Favorited",
      "${profiles[currentIndex].name} has been added to your favorites.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
