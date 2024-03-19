class ArticleModel {
  final String? author;
  final String? title;
  final String? description;
  final String? date;
  final String? img;
  final String? articleUrl;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.date,
    required this.img,
    required this.articleUrl,
  });

  factory ArticleModel.fromJson(json){
    return ArticleModel(
          author: json["author"],
          title: json["title"],
          description: json["description"],
          date: json["publishedAt"],
          img: json["urlToImage"],
          articleUrl: json["url"],
        );
  }
}
