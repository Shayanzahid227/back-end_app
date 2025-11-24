import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/base_view_model/base_view_model.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/constant/colors.dart';
import 'package:hustler_syn/core/constant/colors.dart' as AppColors;
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/model/message_model.dart';
import 'package:hustler_syn/screens/chat/chat_view_model.dart';
import 'package:provider/provider.dart';

class ConversationScreen extends StatelessWidget {
  final String userName;
  final String userImage;
  final String userType;

  const ConversationScreen({
    super.key,
    required this.userName,
    required this.userImage,
    required this.userType,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatViewModel(),
      child: Consumer<ChatViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.backGroundColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
              onPressed: () => Navigator.of(context).pop(),
            ),
            titleSpacing: 0,
            title: Row(
              children: [
                CircleAvatar(
                  radius: 18.r,
                  backgroundImage: AssetImage(userImage),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: style16_600.copyWith(color: AppColors.whiteColor),
                    ),
                    Text(
                      userType,
                      style: style12_500.copyWith(color: AppColors.greyColor),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.more_vert, color: AppColors.whiteColor),
                onPressed: () {},
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  itemCount: viewModel.messages.length,
                  itemBuilder: (context, index) {
                    return MessageBubble(message: viewModel.messages[index]);
                  },
                ),
              ),
              _buildChatInput(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatInput(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.backGroundColor,
        // border:
        //     Border(top: BorderSide(color: AppColors.borderColor, width: 0.5)),
      ),
      child: Row(
        children: [
          Icon(Icons.add, color: AppColors.whiteColor, size: 24.w),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              style: style14_400.copyWith(color: AppColors.whiteColor),
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.mic,
                  size: 20,
                  color: greyColor,
                ),
                hintText: 'Type a message...',
                hintStyle: style16_400.copyWith(),
                filled: true,
                fillColor: AppColors.planCardColor,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: BorderRadius.circular(999)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          CircleAvatar(
            radius: 20.r,
            backgroundColor: AppColors.primaryColor,
            child: Image.asset(
              AppAssets().shareIcon,
              scale: 4,
              color: blackColor,
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final MessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final bool isSentByMe = message.isSentByMe;
    final Color bubbleColor =
        isSentByMe ? AppColors.primaryColor : AppColors.planCardColor;
    final Alignment alignment =
        isSentByMe ? Alignment.centerRight : Alignment.centerLeft;
    final BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(15.r),
      topRight: Radius.circular(15.r),
      bottomLeft: isSentByMe ? Radius.circular(15.r) : Radius.circular(3.r),
      bottomRight: isSentByMe ? Radius.circular(3.r) : Radius.circular(15.r),
    );

    return Align(
      alignment: alignment,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.all(12.w),
        constraints: BoxConstraints(maxWidth: 0.75.sw),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: borderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.text,
              style: style14_400.copyWith(
                  color: isSentByMe ? backGroundColor : AppColors.whiteColor),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message.time,
                  style: style12_500.copyWith(
                      color: isSentByMe
                          ? AppColors.backGroundColor
                          : AppColors.whiteColor.withOpacity(0.7)),
                ),
                if (isSentByMe)
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Icon(
                      Icons.done_all,
                      size: 10.w,
                      color: AppColors.whiteColor.withOpacity(0.7),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
