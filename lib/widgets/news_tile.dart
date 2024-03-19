import 'package:flutter/material.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/theme/theme.dart';

import '../screens/web_view_screen.dart';

class NewsTile extends StatelessWidget {
  final ArticleModel article;
  const NewsTile({required this.article,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebViewScreen(url: article.articleUrl!,),),);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(article.img ??
                    "https://i.pinimg.com/564x/fc/7e/ce/fc7ece8e8ee1f5db97577a4622f33975.jpg"),
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
          ),
           Container(
                height: 3,
                width: double.infinity,
                color: Colors.grey,
              )
        ],
      ),
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
