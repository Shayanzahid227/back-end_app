import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/colors.dart' as AppColors;
import 'package:hustler_syn/core/constant/strings.dart';
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/model/post_model.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: planCardColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundImage: AssetImage(post.profileImage),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(post.userName,
                            style: style16_600.copyWith(color: Colors.white)),
                        Icon(
                          Icons.more_vert,
                          size: 30,
                          color: whiteColor,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: greyColor,
                          size: 16.w,
                        ),
                        SizedBox(width: 5.w),
                        Text(post.timeAgo,
                            style: style14_400.copyWith(
                                color: AppColors.greyColor)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Image.asset(
              AppAssets().splashIcon,
              scale: 4,
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            post.postTitle,
            style: style18_600.copyWith(fontWeight: FontWeight.w700),
          ),
          10.verticalSpace,
          Text(
            post.jobDescription,
            style: style14_400.copyWith(color: greyColor),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          15.verticalSpace,
          Divider(
            color: greyColor.withOpacity(0.4),
          ),
          15.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.favorite_outline_outlined,
                color: whiteColor,
                size: 30,
              ),
              Icon(
                Icons.chat_bubble,
                color: whiteColor,
                size: 30,
              ),
              Icon(
                Icons.share,
                color: whiteColor,
                size: 30,
              ),
              Icon(
                Icons.list_alt_outlined,
                color: whiteColor,
                size: 30,
              )
            ],
          )
        ],
      ),
    );
  }
}
