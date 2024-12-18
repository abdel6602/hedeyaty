class Event {
  final String title;
  final DateTime date;

  Event({required this.title, required this.date});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'date': date
  };
}