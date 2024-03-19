import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';
import '../service/news_service.dart';
import '../theme/theme.dart';
import '../widgets/category_item.dart';
import '../widgets/latest_news_item.dart';
import '../widgets/news_tile.dart';

class NewsLayout extends StatefulWidget {
  const NewsLayout({super.key});

  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  List<ArticleModel> articles = [];
  bool isLoading = true;
  Future<void> getGeneralNews() async {
    articles = await NewsService(dio: Dio()).getNews("general");
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: primaryColor,
              radius: 18,
              child: Icon(
                Icons.search_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Latest News",
                  style: heading,
                ),
              ),
            ),
            isLoading
                ? SliverToBoxAdapter(
                    child: Center(
                    child: Image.asset(
                      "assets/loading.gif",
                      height: 90,
                      width: 90,
                    ),
                  ))
                : articles.isNotEmpty
                    ? SliverToBoxAdapter(
                        child: SizedBox(
                          height: 240,
                          child: latestNewsListView(articles),
                        ),
                      )
                    : SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            "OOPS!,There Is An Error,Try Again Later!",
                            style: subTitle,
                          ),
                        ),
                      ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  height: 32,
                  child: categoriesListView(),
                ),
              ),
            ),
            FutureBuilder(
                future:
                    NewsService(dio: Dio()).getNews(categoryName ?? "general"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return newsListView(articles: snapshot.data!);
                  } else if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          "OOPS!,There Is An Error,Try Again Later!",
                          style: subTitle,
                        ),
                      ),
                    );
                  } else {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Image.asset(
                          "assets/loading.gif",
                          height: 90,
                          width: 90,
                        ),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  String? categoryName;
  int selectedIndex = 0;
  ListView categoriesListView() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categoriesModel.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 32,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  isLoading = true;
                  categoryName = categoriesModel[index];
                  isLoading = false;
                });
              },
              child: CategoryItem(
                title: categoriesModel[index],
                isTapped: selectedIndex == index ? true : false,
              ),
            ),
          );
        });
  }
}
