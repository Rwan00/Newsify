import 'package:flutter/material.dart';

class LatestNewsItem extends StatelessWidget {
  const LatestNewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/kk.jpg"),
        
        )
      ),
    );
  }
}