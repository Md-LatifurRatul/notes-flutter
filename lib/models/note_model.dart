class NoteModel {
  final String title;
  final String description;

  NoteModel({required this.title, required this.description});

  factory NoteModel.fromMap(Map<String, dynamic> note) {
    return NoteModel(
      title: note['title'] ?? '',

      description: note['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, "description": description};
  }
}
