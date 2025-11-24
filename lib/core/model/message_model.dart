// Model for individual message in the conversation screen
class MessageModel {
  final String text;
  final String time;
  final bool isSentByMe;

  MessageModel({
    required this.text,
    required this.time,
    required this.isSentByMe,
  });
}