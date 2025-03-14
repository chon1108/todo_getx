class TodoModel {
  String title;
  String description;
  bool isDone;

  String? uid;
  String? docId;

  TodoModel({
    required this.title,
    required this.description,
    required this.isDone,
    this.uid,
    this.docId,
    
  });

  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description, 'isDone': isDone, 'uid': uid};
  }

  TodoModel.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      description = json['description'],
      isDone = json['isDone'],
      uid = json['uid'],
      docId = json['docId'];
}
