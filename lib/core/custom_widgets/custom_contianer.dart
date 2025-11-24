
import 'package:flutter/material.dart';
import 'package:hustler_syn/core/constant/colors.dart';

class CustomContainer extends StatelessWidget {
  final List<Widget> children;
  final double? verticalMargin;
  final Color? backGroundColor;

  const CustomContainer({
    required this.children,
    this.verticalMargin,
    this.backGroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: EdgeInsets.symmetric(vertical: verticalMargin ?? 15),
      decoration: BoxDecoration(
        color: backGroundColor ?? backColor2,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      ),
    );
  }
}
