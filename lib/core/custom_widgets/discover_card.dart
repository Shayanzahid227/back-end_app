import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/screens/discover/discover_view_model.dart';

class CustomDiscoverCard extends StatelessWidget {
  final DiscoverModel model;

  const CustomDiscoverCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    bool isComingSoon = model.type == 'Coming Soon';

    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
          color: planCardColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
              color: model.type == 'Coming Soon'
                  ? primaryColor.withOpacity(0.25)
                  : borderColor)),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Container(
              height: 80.h,
              width: 80..w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: isComingSoon
                    ? null
                    : DecorationImage(
                        image: AssetImage(
                            model.profileImage.replaceAll('AppAssets().', '')),
                        fit: BoxFit.cover,
                      ),
              ),
              child: isComingSoon
                  ? Center(
                      child: CircleAvatar(
                      radius: 30.r,
                      backgroundImage: AssetImage(
                        model.profileImage.replaceAll('AppAssets().', ''),
                      ),
                    ))
                  : null,
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.hustlerName,
                    style: style16_600.copyWith(),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    model.type,
                    style: style14_400.copyWith(color: greyColor),
                  ),
                  model.type == 'Coming Soon'
                      ? Text('')
                      : Row(
                          children: [
                            Image(
                              image: AssetImage(
                                AppAssets().locationIcon,
                              ),
                              height: 12.h,
                              color: whiteColor,
                              width: 10.w,
                            ),
                            5.horizontalSpace,
                            Text(
                              model.distance,
                              style: style14_400.copyWith(color: greyColor),
                            ),
                            10.horizontalSpace,
                            Icon(Icons.star, color: Colors.amber, size: 16.w),
                            5.horizontalSpace,
                            Text(
                              model.rating,
                              style: style14_400.copyWith(),
                            ),
                            Spacer(),
                            if (model.amount.isNotEmpty)
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  model.amount,
                                  style:
                                      style14_600.copyWith(color: primaryColor),
                                ),
                              ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
