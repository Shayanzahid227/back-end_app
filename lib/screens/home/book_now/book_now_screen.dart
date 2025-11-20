// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/custom_button.dart';
import 'package:hustler_syn/core/model/profile_model.dart';
import 'package:hustler_syn/core/model/service_price_model.dart';
import 'package:hustler_syn/screens/home/check_out/check_out_screen.dart';

class Information extends StatelessWidget {
  final ProfileModel profileModel;
  int? index;

  Information({super.key, required this.profileModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0D1B2A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          profileModel.image ?? AppAssets().boys,
                        ),
                        fit: BoxFit.cover)),
                height: MediaQuery.sizeOf(context).height * 0.4,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(left: 15, top: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: darkGreyColor,
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              size: 15.w,
                              Icons.arrow_back,
                              color: whiteColor,
                            )),
                      ),
                    ),
                  ),
                )),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                color: Color(0xff1B263B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(profileModel.name ?? "",
                          style: style20_600.copyWith(fontSize: 30.sp)),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    profileModel.role ?? "",
                    style: style18_500.copyWith(
                        color: greyColor, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 6),
                      Text(
                        "${profileModel.rating ?? 0.0}",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                      10.horizontalSpace,
                      Icon(Icons.location_on_outlined,
                          color: greyColor, size: 20),
                      SizedBox(width: 6),
                      Text(profileModel.distance ?? "",
                          style: style16_400.copyWith(color: greyColor)),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text("About", style: style20_600),
                  SizedBox(height: 8),
                  Text(
                    profileModel.description ??
                        "Experienced professional cleaner with 5+ years in residential and commercial cleaning. Specialized in deep cleaning and eco-friendly solutions.",
                    style: style16_400.copyWith(color: greyColor),
                  ),
                  SizedBox(height: 25.h),
                  Text("Services & Pricing", style: style20_600),
                  SizedBox(height: 15.h),
                  Column(
                    children:
                        profileModel.servicePrices!.map((ServicePrice service) {
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColor),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(service.serviceName ?? "",
                                    style: style18_600),
                                Text("${service.price}",
                                    textAlign: TextAlign.right,
                                    style: style25B.copyWith(
                                        fontSize: 24.sp, color: primaryColor)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(service.description ?? "",
                                style: style14_400.copyWith(color: greyColor)),
                            Text(service.duration ?? "",
                                style: style14_400.copyWith(color: greyColor)),
                            SizedBox(height: 15),
                            SizedBox(
                                width: double.infinity,
                                child: CustomButton(
                                  text: "Book Now",
                                  onTap: () {
                                    Get.to(Checkout(
                                        profileModel: profileModel,
                                        serviceModel:
                                            service // PASS THE SPECIFIC SERVICE HERE
                                        ));
                                  },
                                ))
                          ],
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
