class Task {
  int? id;
  final String title;
  final String description;
  final String dateToFinish;

  Task(
      {this.id,
      required this.title,
      required this.description,
      required this.dateToFinish});

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dateToFinish: map['dateToFinish'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'title': title,
      'description': description,
      'dateToFinish': dateToFinish,
    };
  }
}
