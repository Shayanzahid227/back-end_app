class EventModel {
  final String image;
  final String title;
  final String description;

  final String time;
  final String date;
  final String day;

  EventModel({
    required this.image,
    required this.title,
    required this.description,
    String? time,
    String? date,
    String? day,
  })  : time = time ?? _generateTime(),
        date = date ?? _generateDate(),
        day = day ?? _generateDay();

  static String _generateTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')}";
  }

  static String _generateDate() {
    final now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
  }

  static String _generateDay() {
    final now = DateTime.now();
    const days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    return days[now.weekday - 1];
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      time: json['time'],
      date: json['date'],
      day: json['day'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'description': description,
      'time': time,
      'date': date,
      'day': day,
    };
  }
}
