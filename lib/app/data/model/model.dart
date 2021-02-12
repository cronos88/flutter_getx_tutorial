class MyModel {
  String author;
  String title;
  String description;

  MyModel({author, title, body});

  MyModel.fromJson(Map<String, dynamic> json) {
    this.author = json['author'];
    this.title = json['title'];
    this.description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
