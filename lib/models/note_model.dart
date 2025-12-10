class NoteModel {
  final int? id;
  final String title;
  final String body;
  NoteModel({this.id, required this.title, required this.body});

  factory NoteModel.fromMap(Map<String, dynamic> json) {
    return NoteModel(id: json['id'], title: json['title'], body: json['body']);
  }
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'body': body};
  }
}
