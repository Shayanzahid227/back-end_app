import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/constant/colors.dart' as AppColors;
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';
import 'package:hustler_syn/screens/chat/chat_view_model.dart';
import 'package:hustler_syn/screens/chat/conversation_screen.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatViewModel(),
      child: Consumer<ChatViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: CustomAppBar(
            title: 'Messages',
            centerTitle: false,
            showBackButton: false,
            action: Icon(
              Icons.settings,
              color: AppColors.whiteColor,
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: TextFormField(
                    decoration: customAuthField.copyWith(
                      hintText: 'Search Conversations',
                      hintStyle:
                          style14_500.copyWith(color: AppColors.greyColor),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.chatList.length,
                    itemBuilder: (context, index) {
                      return ChatCard(
                        chat: viewModel.chatList[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  final ChatModel chat;

  const ChatCard({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    bool hasUnread = chat.unreadSms != "0";

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ConversationScreen(
              userName: chat.userName,
              userImage: chat.userImage,
              userType: chat.userType,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
              color: AppColors.planCardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderColor)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: AssetImage(chat.userImage),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.userName,
                      style: style16_600.copyWith(color: AppColors.whiteColor),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.borderColor),
                              color: AppColors.backGroundColor,
                              borderRadius: BorderRadius.circular(999.r)),
                          child: Text(
                            chat.userType,
                            style: style12_500.copyWith(
                                color: AppColors.primaryColor),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: Text(
                            chat.lastChat,
                            style: style14_400.copyWith(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    chat.timeAgo,
                    style: style12_500.copyWith(),
                  ),
                  SizedBox(height: 4.h),
                  if (hasUnread)
                    CircleAvatar(
                      radius: 10.r,
                      backgroundColor: AppColors.primaryColor,
                      child: Text(
                        chat.unreadSms,
                        style:
                            style12_600.copyWith(color: AppColors.whiteColor),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
