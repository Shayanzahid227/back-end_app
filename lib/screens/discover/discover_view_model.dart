import 'package:hustler_syn/core/base_view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/enums/discover_screen.dart';

class DiscoverModel {
  final String hustlerName;
  final String type;
  final String distance;
  final String rating;
  final String amount;
  final String profileImage;

  DiscoverModel({
    required this.hustlerName,
    required this.type,
    required this.distance,
    required this.rating,
    required this.amount,
    required this.profileImage,
  });
}

class DiscoverViewModel extends BaseViewModel {
  DiscoverCategory _selectedCategory = DiscoverCategory.all;
  DiscoverCategory get selectedCategory => _selectedCategory;

  final List<DiscoverModel> _fullDiscoverList = [
    DiscoverModel(
      hustlerName: 'Taxi Service',
      type: 'Coming Soon',
      distance: '0.0 km',
      rating: '0.0',
      amount: '',
      profileImage: AppAssets().boys,
    ),
    DiscoverModel(
      hustlerName: 'Sarah Johnson',
      type: 'Plumbing',
      distance: '2.3 km',
      rating: '4.8',
      amount: 'R50+',
      profileImage: AppAssets().userImage,
    ),
    DiscoverModel(
      hustlerName: 'Mike Chen',
      type: 'Carpentry',
      distance: '3.1 km',
      rating: '4.9',
      amount: 'R900+',
      profileImage: AppAssets().boys,
    ),
    DiscoverModel(
      hustlerName: 'Emma Davis',
      type: 'Electrical',
      distance: '1.5 km',
      rating: '4.7',
      amount: 'R500+',
      profileImage: AppAssets().userImage,
    ),
    DiscoverModel(
      hustlerName: 'Emma Davis',
      type: 'Design',
      distance: '1.5 km',
      rating: '4.7',
      amount: 'R50+',
      profileImage: AppAssets().boys,
    ),
  ];

  List<DiscoverModel> get discoverList {
    if (_selectedCategory == DiscoverCategory.all) {
      return _fullDiscoverList;
    }

    String categoryString = _selectedCategory.name.capitalize();
    return _fullDiscoverList
        .where((model) => model.type == categoryString)
        .toList();
  }

  void selectCategory(DiscoverCategory category) {
    _selectedCategory = category;
    notifyListeners();
  }

  String getAppBarTitle() {
    switch (_selectedCategory) {
      case DiscoverCategory.all:
        return 'Discover';
      case DiscoverCategory.plumbing:
        return 'Discover Plumbing';
      case DiscoverCategory.carpentry:
        return 'Discover Carpentry';
      case DiscoverCategory.electrical:
        return 'Discover Electrical';
      case DiscoverCategory.design:
        return 'Discover Design';
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
