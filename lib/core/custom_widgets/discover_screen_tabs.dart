import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/enums/discover_screen.dart';

class CategoryTab extends StatelessWidget {
  final DiscoverCategory category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryTab({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  String get categoryName {
    return category.name.capitalize!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 7.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          color: isSelected ? primaryColor : backGroundColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          categoryName,
          style: style14_500.copyWith(
              color: isSelected ? backGroundColor : whiteColor),
        ),
      ),
    );
  }
}
