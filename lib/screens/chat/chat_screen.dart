import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hustler_syn/core/constant/auth_text_field.dart';
import 'package:hustler_syn/core/constant/colors.dart' as AppColors;
import 'package:hustler_syn/core/constant/text_style.dart';
import 'package:hustler_syn/core/custom_widgets/app_bar.dart';
import 'package:hustler_syn/core/custom_widgets/chat_card.dart';
import 'package:hustler_syn/core/model/chat_mode.dart';
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
