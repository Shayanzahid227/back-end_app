import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:hustler_syn/core/base_view_model/base_view_model.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/model/create_new_post.dart';
import 'package:hustler_syn/core/model/post_model.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreenViewModel extends BaseViewModel {
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

  ///
  /// this will be used and above list will be removed once i finalized the UI of postcard
  ///
  final List<CreateNewPostModel> dummyPosts = [
    CreateNewPostModel(
      image: AppAssets().userImage,
      title: "Morning Motivation",
      description: "Start your day with positive energy and a clear mindset.",
    ),
    CreateNewPostModel(
      image: AppAssets().boys,
      title: "Tech Update",
      description: "Flutter 4.0 released with major performance improvements.",
    ),
    CreateNewPostModel(
      image: AppAssets().userImage,
      title: "Healthy Lifestyle",
      description: "10 quick exercises you can do at home to stay fit.",
    ),
    CreateNewPostModel(
      image: AppAssets().boys,
      title: "Travel Diaries",
      description: "Exploring the beauty of Bali and its serene beaches.",
    ),
    CreateNewPostModel(
      image: AppAssets().userImage,
      title: "Food Love",
      description: "Try this delicious homemade pasta recipe tonight.",
    ),
  ];
}
