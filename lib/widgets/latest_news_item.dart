import 'package:flutter/material.dart';
import 'package:newsify/theme/theme.dart';

class LatestNewsItem extends StatelessWidget {
  const LatestNewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 8),
      child: Container(
        height: 240,
        width: 345,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              "assets/kk.jpg",
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
                "By Rwan",
                style: subTitle,
              ),
              Text(
                "I'm excited to introduce  my latest creation: Swift Buy, an e-commerce app designed to simplify your online shopping experience.",
                style: titleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

latestNewsListView(){
  return ListView.builder(
      scrollDirection: Axis.horizontal,
    itemCount: 10,
      physics: const PageScrollPhysics(),
      itemBuilder: (context,index){
      return LatestNewsItem();
      }
  );
}
