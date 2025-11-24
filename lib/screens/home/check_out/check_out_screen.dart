import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';
import 'package:hustler_syn/core/custom_widgets/custom_button.dart';
import 'package:hustler_syn/core/custom_widgets/custom_contianer.dart';
import 'package:hustler_syn/core/model/profile_model.dart';
import 'package:hustler_syn/core/model/service_price_model.dart';
import 'package:hustler_syn/screens/home/check_out/check_out_view_model.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  final ProfileModel profileModel;
  final ServicePrice serviceModel;
  const Checkout(
      {super.key, required this.profileModel, required this.serviceModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CheckOutViewModel(),
      child: Consumer<CheckOutViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: CustomAppBar(
            title: 'checkOut',
            action: Text(''),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomContainer(
                    children: [
                      Text(
                        'Service Summary',
                        style: style25_400.copyWith(
                            fontSize: 24.sp, fontWeight: FontWeight.w600),
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundImage: AssetImage(profileModel.image ??
                                'error'), // Placeholder image
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(profileModel.name ?? "Hazma",
                                  style: style18_600),
                              Text(profileModel.role ?? "Professional Cleaner",
                                  style:
                                      style14_400.copyWith(color: greyColor)),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Divider(color: borderColor, thickness: 1),
                      const SizedBox(height: 20),
                      Text(profileModel.description ?? "Basic Home Cleaning",
                          style: style18_600.copyWith()),
                      const SizedBox(height: 8),
                      Text(
                          profileModel.description ??
                              "Standard cleaning of living areas, bedrooms, kitchen, and bathrooms",
                          style: style14_400.copyWith(color: greyColor)),
                      SizedBox(height: 12),
                      Text("${serviceModel?.duration ?? 'duration '}",
                          style: style14_400.copyWith(color: greyColor)),
                      const SizedBox(height: 20),
                      Divider(color: Colors.grey[800], thickness: 1),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Amount", style: style18_600),
                          Text("${serviceModel?.price ?? 'Price'}",
                              style: style14B.copyWith(
                                  fontSize: 30.sp, color: primaryColor)),
                        ],
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Text("Date and Time", style: style16_600),
                  10.verticalSpace,
                  TextFormField(
                    controller: model.dateController, // ADDED CONTROLLER
                    readOnly: true, // Prevents keyboard from popping up
                    onTap: () =>
                        model.selectDate(context), // ADDED ONTAP HANDLER
                    style: style16_500.copyWith(color: whiteColor),
                    decoration: customAuthField.copyWith(
                        hintText: 'mm/dd/yyyy',
                        prefixIcon: Icon(
                          Icons.calendar_month,
                          color: greyColor,
                        ),
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          color: whiteColor,
                        )),
                  ),
                  10.verticalSpace,

                  ///
                  ///. payment details
                  ///
                  CustomContainer(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            height: 20.h,
                            width: 20.w,
                            AppAssets().s1Icon,
                            color: whiteColor,
                          ),
                          const SizedBox(width: 10),
                          Text("payment Details",
                              style: style25_400.copyWith(
                                  fontSize: 24, fontWeight: FontWeight.w700)),
                        ],
                      ),
                      20.verticalSpace,
                      Text("Card Number", style: style14_600),
                      10.verticalSpace,
                      TextFormField(
                          decoration: customAuthField.copyWith(
                              hintText: '1234 5678 9012 3456')),
                      20.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Expiry date',
                                  style: style14_600,
                                ),
                                8.verticalSpace,
                                TextFormField(
                                    decoration: customAuthField.copyWith(
                                        hintText: 'mm/yyyyy')),
                              ],
                            ),
                          ),
                          20.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CVV',
                                  style: style14_600,
                                ),
                                8.verticalSpace,
                                TextFormField(
                                    decoration: customAuthField.copyWith(
                                        hintText: 'CVV')),
                              ],
                            ),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      Text("Cardholder Name", style: style14_600),
                      8.verticalSpace,
                      TextFormField(
                          decoration:
                              customAuthField.copyWith(hintText: 'Hamza Khan')),
                      20.verticalSpace,
                      CustomButton(
                        text: "Pay R400",
                        onTap: () {},
                      ),
                      20.verticalSpace,
                    ],
                  ),
                  10.verticalSpace,
                  CustomContainer(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            height: 20.h,
                            width: 20.w,
                            AppAssets().s1Icon,
                            color: whiteColor,
                          ),
                          const SizedBox(width: 10),
                          Text("Voucher",
                              style: style25_400.copyWith(
                                  fontSize: 24, fontWeight: FontWeight.w700)),
                        ],
                      ),
                      20.verticalSpace,
                      Text("Cardholder Name", style: style14_600),
                      8.verticalSpace,
                      TextFormField(
                          decoration: customAuthField.copyWith(
                              hintText: 'Enter your voucher code ')),
                      20.verticalSpace,
                      CustomButton(
                        text: "Pay R400",
                        onTap: () {},
                      ),
                      50.verticalSpace,
                    ],
                  ),
                  50.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
