class MyModel {
  String author;
  String title;
  String content;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  MyModel({author, title, content, description, irl, urlToImage, publishedAt});

  MyModel.fromJson(Map<String, dynamic> json) {
    this.author = json['author'];
    this.title = json['title'];
    this.content = json['content'];
    this.description = json['description'];
    this.url = json['url'];
    this.urlToImage = json['urlToImage'];
    this.publishedAt = json['publishedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['title'] = this.title;
    data['content'] = this.content;
    data['description'] = this.description;
    return data;
  }
}
