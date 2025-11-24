import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';

class LanguageChip extends StatelessWidget {
  final String language;
  final VoidCallback onRemove;

  const LanguageChip({required this.language, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(language, style: style14_400.copyWith(color: Colors.white)),
      backgroundColor: darkPurpleColor,
      side: const BorderSide(color: primaryColor, width: 1),
      deleteIcon: const Icon(Icons.close, size: 18, color: greyColor),
      onDeleted: onRemove,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    );
  }
}
