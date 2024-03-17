import 'package:flutter/material.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/theme/theme.dart';

class NewsTile extends StatelessWidget {
  final ArticleModel article;
  const NewsTile({required this.article,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNe,
        ),
        Text(
          article.title??"",
          style: titleStyle,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            Text(
              article.author??"",
              style: subTitle,
            ),
            const Spacer(),
            Text(
              article.date!.substring(0,10),
              style: subTitle,
            ),
          ],
        )
      ],
    );
  }
}

newsListView({required List<ArticleModel>articles}) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(childCount: articles.length, (context, index) {
      return  Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: NewsTile(article:articles[index]),
      );
    }),
  );
}
