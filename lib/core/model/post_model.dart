class PostModel {
  final String profileImage;
  final String userName;
  final String timeAgo;
  final String postTitle;
  final String jobDescription;
  final String category;
  final String budgetPrice;
  final List<String> languageKnown;
  final String jobLocation;

  PostModel({
    required this.profileImage,
    required this.userName,
    required this.timeAgo,
    required this.postTitle,
    required this.jobDescription,
    required this.category,
    required this.budgetPrice,
    required this.languageKnown,
    required this.jobLocation,
  });
}