import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/service/news_service.dart';
import 'package:newsify/theme/theme.dart';

class LatestNewsItem extends StatefulWidget {
  final ArticleModel article;
  const LatestNewsItem({required this.article, super.key});

  @override
  State<LatestNewsItem> createState() => _LatestNewsItemState();
}



class _LatestNewsItemState extends State<LatestNewsItem> {

 

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
              widget.article.img ??
                  "https://i.pinimg.com/564x/fc/7e/ce/fc7ece8e8ee1f5db97577a4622f33975.jpg",
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
                widget.article.author ?? "",
                style: subTitle,
              ),
              Text(
                widget.article.title!,
                style: titleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

latestNewsListView(articles) {
 // getGeneralNews();
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
