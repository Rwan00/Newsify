import 'package:dio/dio.dart';
import 'package:newsify/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService({required this.dio});

  Future<List<ArticleModel>> getNews() async {
    try {
      var response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=56906d2f18e54b34a25a29a9dd93f8a6");
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];
      List<ArticleModel> articleList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          author: article["author"],
          title: article["title"],
          description: article["description"],
          date: article["publishedAt"],
          img: article["urlToImage"],
          articleUrl: article["url"],
        );
        articleList.add(articleModel);
      }
      return articleList;
    } catch (e) {
      return [];
    }
  }
}
