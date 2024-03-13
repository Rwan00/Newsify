import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/service/news_service.dart';
import 'package:newsify/theme/theme.dart';

class LatestNewsItem extends StatelessWidget {
  final ArticleModel article;
  const LatestNewsItem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 8),
      child: Container(
        height: 240,
        width: 345,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              article.img ?? "https://pin.it/21ebdJ0LQ",
            ),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.author??"",
                style: subTitle,
              ),
              Text(
                article.title!,
                style: titleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

latestNewsListView() {
  getGeneralNews();
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: articles.length,
      physics: const PageScrollPhysics(),
      itemBuilder: (context, index) {
        return LatestNewsItem(
          article: articles[index],
        );
      });
}

List<ArticleModel> articles = [];
Future<List<ArticleModel>> getGeneralNews() async {
  articles = await NewsService(dio: Dio()).getNews();
  return articles;
}
