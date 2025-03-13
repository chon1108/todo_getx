class TodoModel {
  String title;
  String description;
  bool isDone;

  TodoModel({
    required this.title,
    required this.description,
    required this.isDone,
  });

  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description, 'isDone': isDone};
  }

  TodoModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        isDone = json['isDone'];
}
