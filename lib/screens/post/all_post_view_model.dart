import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hustler_syn/core/base_view_model/base_view_model.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:image_picker/image_picker.dart';

class AllPostViewModel extends BaseViewModel {
  ///
  /// for language adding and
  ///
  final TextEditingController languageInputController = TextEditingController();
  final List<String> languages = [];
  void addLanguage() {
    final language = languageInputController.text.trim();
    if (language.isNotEmpty && !languages.contains(language)) {
      languages.add(language);
      languageInputController.clear();
      notifyListeners();
    }
  }

  void removeLanguage(String language) {
    languages.remove(language);
    notifyListeners();
  }

  @override
  void dispose() {
    languageInputController.dispose();
    super.dispose();
  }

  String? selectCategory;



   selectCategoryClick(String? category) {
    selectCategory = category;
    notifyListeners(); // <-- THIS IS THE CRUCIAL CALL
  }

  final categories = [
    "Plumber",
    "Car Mechanic",
    "Electrician",
    "Painter",
    "Carpenter",
    "Welder",
    "Driver",
    "Cleaner",
    "Mason",
  ];

  ///
  ///. all post list
  ///
  final List<PostModel> allPosts = [
    PostModel(
      profileImage: AppAssets().boys,
      userName: "John Doe",
      timeAgo: "2h ago",
      postTitle: "Need a Flutter Developer",
      jobDescription: "Looking for a Flutter dev to build a basic app",
      category: "Plumber",
      budgetPrice: "R 200",
      languageKnown: ["English", "Spanish"],
      jobLocation: "Midrand, Gauteng",
    ),
    PostModel(
      profileImage: AppAssets().userImage,
      userName: "Sarah Connor",
      timeAgo: "5m ago",
      postTitle: "UI/UX Design for E-commerce",
      jobDescription: "Seeking a designer for a new online shop interface.",
      category: "Designer",
      budgetPrice: "R 500",
      languageKnown: ["English"],
      jobLocation: "Soweto, Gauteng",
    ),
    PostModel(
      profileImage: AppAssets().boys,
      userName: "Mike Chen",
      timeAgo: "1d ago",
      postTitle: "Carpentry for Custom Bookshelves",
      jobDescription: "Expert carpenter required for custom built-in shelves.",
      category: "Mechanic",
      budgetPrice: "R 1200",
      languageKnown: ["English", "Mandarin"],
      jobLocation: "Makapanstad, North West",
    )
  ];

  ///
  ///. business image picker in a row in end of screen
  ///
  List<File?> businessImages = [null, null, null, null];
  List<Uint8List?> businessImagesWeb = [null, null, null, null];

  Future pickBusinessImage(int index) async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.gallery);
    if (result == null) return;

    if (kIsWeb) {
      businessImagesWeb[index] = await result.readAsBytes();
    } else {
      businessImages[index] = File(result.path);
    }
    notifyListeners();
  }
}

class PostModel {
  final String profileImage;
  final String userName;
  final String timeAgo;
  final String postTitle;
  final String jobDescription;
  final String category;
  final String budgetPrice;
  final List<String> languageKnown;
  final String jobLocation;

  PostModel({
    required this.profileImage,
    required this.userName,
    required this.timeAgo,
    required this.postTitle,
    required this.jobDescription,
    required this.category,
    required this.budgetPrice,
    required this.languageKnown,
    required this.jobLocation,
  });
}
