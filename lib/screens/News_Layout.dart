import 'package:flutter/material.dart';

import 'package:newsify/theme/theme.dart';
import 'package:newsify/widgets/category_item.dart';

import '../widgets/latest_news_item.dart';

class NewsLayout extends StatefulWidget {
  const NewsLayout({super.key});

  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: CircleAvatar(
              backgroundColor: primaryColor,
              radius: 26,
              child: Icon(
                Icons.search_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: 32,
        child: categoriesListView(),
        ),
    );
  }
int selectedIndex = 0;
ListView categoriesListView() {
  
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
          itemCount: categoriesModel.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                });
              },
              child: CategoryItem(
                title: categoriesModel[index],
                isTapped: selectedIndex == index ? true : false,
                ),
                );
          });
  }
}
