import 'package:flutter/material.dart';

import '../widgets/latest_news_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(255, 94, 102, 1),
              radius: 26,
              child: Icon(Icons.search_rounded,color: Colors.white,),
            ),
          ),
        ],
      ),
      body: const LatestNewsItem(),
    );
  }
}