class EventModel {
  final String id;
  final String title;
  final String body;
  EventModel({required this.id, required this.title, required this.body});

  factory EventModel.fromMap(Map<String, dynamic> json, {required String id}) {
    return EventModel(
      id: id,
      title: json['title'] ?? "",
      body: json['body'] ?? "",
    );
  }
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'body': body};
  }
}
