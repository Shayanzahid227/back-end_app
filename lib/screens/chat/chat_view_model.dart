import 'package:hustler_syn/core/base_view_model/base_view_model.dart';
import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/model/chat_mode.dart';
import 'package:hustler_syn/core/model/message_model.dart';

class ChatViewModel extends BaseViewModel {
  final List<ChatModel> chatList = [
    ChatModel(
      userImage: AppAssets().boys,
      userName: "Sarah Johnson",
      userType: "Client",
      lastChat: "When can you start the cl...",
      timeAgo: "2m ago",
      unreadSms: "2",
    ),
    ChatModel(
      userImage: AppAssets().userImage,
      userName: "Mike Che",
      userType: "Hustler",
      lastChat: "I can fix that tomorrow morni...",
      timeAgo: "15m ago",
      unreadSms: "1",
    ),
    ChatModel(
      userImage: AppAssets().boys,
      userName: "Emma Wilson",
      userType: "Client",
      lastChat: "Thank you for the great service!",
      timeAgo: "1h ago",
      unreadSms: "0",
    ),
    ChatModel(
      userImage: AppAssets().userImage,
      userName: "James Chen",
      userType: "Hustler",
      lastChat: "I have availability this we...",
      timeAgo: "3h ago",
      unreadSms: "1",
    ),
    ChatModel(
      userImage: AppAssets().userImage,
      userName: "Lisa Anderson",
      userType: "Client",
      lastChat: "Perfect! See you then",
      timeAgo: "1d ago",
      unreadSms: "0",
    ),
  ];
  ///
  ///. conversation
  ///
  final List<MessageModel> messages = [
    MessageModel(
      text:
          "Hi! I saw your job posting. I have 5 years of experience in kitchen repairs.",
      time: "10:30 AM",
      isSentByMe: false,
    ),
    MessageModel(
      text: "That sounds great! Can you come by tomorrow to take a look?",
      time: "10:32 AM",
      isSentByMe: true,
    ),
    MessageModel(
      text: "Yes, I can be there around 2 PM. What's the address?",
      time: "10:35 AM",
      isSentByMe: false,
    ),
    MessageModel(
      text: "123 Main Street, Apartment 4B. Looking forward to seeing you!",
      time: "10:36 AM",
      isSentByMe: true,
    ),
    MessageModel(
      text: "Perfect! See you tomorrow at 2 PM 👍",
      time: "10:38 AM",
      isSentByMe: false,
    ),
  ];
}


