import 'package:flutter/material.dart';
import 'package:newsify/models/article_model.dart';

import 'package:newsify/theme/theme.dart';

import '../screens/web_view_screen.dart';

class LatestNewsItem extends StatelessWidget {
  final ArticleModel article;
  const LatestNewsItem({super.key, required this.article});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebViewScreen(url: article.articleUrl!,),),);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 8),
        child: Container(
          height: 240,
          width: 345,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                article.img ??
                    "https://i.pinimg.com/564x/fc/7e/ce/fc7ece8e8ee1f5db97577a4622f33975.jpg",
              ),
              fit: BoxFit.cover,
              opacity: 0.6,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title!,
                  style: titleStyle,
                ),
                Text(
                  article.author != null ? "By ${article.author}" : "",
                  style: subTitle.copyWith(color: Colors.white),
                ),
              ],
            ),
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
