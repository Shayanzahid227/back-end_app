// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/model/profile_model.dart';

class ProfileCard extends StatelessWidget {
  ProfileModel profileModel = ProfileModel();

  ProfileCard({required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.black,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              children: [
                ///
                ///. main big image --> user image
                ///
                Image.asset(
                  profileModel.image ?? AppAssets().boys,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          blackColor.withOpacity(1),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 30,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(profileModel.name ?? '', style: style25B.copyWith()),

                    ///
                    ///. verified badge container in front of name
                    ///
                    30.horizontalSpace,
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadiusDirectional.circular(999.r),
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 12, vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets().vettedIcon,
                              scale: 4,
                              height: 13.h,
                              width: 13.w,
                            ),
                            5.horizontalSpace,
                            Text(
                              'Vetted',
                              style: style12_600.copyWith(color: blackColor),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 4),
                Text(profileModel.role ?? '',
                    style: style16_600.copyWith(fontSize: 17.sp)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 18),
                    SizedBox(width: 5),
                    Text(
                      "${profileModel.rating}",
                      style: style14_600.copyWith(fontSize: 15.sp),
                    ),
                    10.horizontalSpace,
                    Icon(Icons.location_on_outlined,
                        color: greyColor, size: 18),
                    SizedBox(width: 5),
                    Text(
                      '${profileModel.distance}',
                      style: style14_600.copyWith(
                          fontSize: 15.sp, color: greyColor),
                    )
                  ],
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: profileModel.tags!.map((tag) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: backGroundColor,
                        borderRadius: BorderRadius.circular(11283.r),
                      ),
                      child: Text(
                        tag,
                        style: style14_600,
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
