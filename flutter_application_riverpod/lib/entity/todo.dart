class TodoEntity {
  final int? id;
  final String? title;
  final String? description;
  final bool? completed;

  TodoEntity({this.id, this.title, this.description, this.completed});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'completed': completed,
    };
  }

  static TodoEntity fromMap(Map<String, dynamic> map) {
    return TodoEntity(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      completed: map['completed'],
    );
  }
}
