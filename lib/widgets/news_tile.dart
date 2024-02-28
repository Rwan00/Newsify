import 'package:flutter/material.dart';
import 'package:newsify/theme/theme.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset("assets/kk.jpg"),
        ),
        Text(
          "Ukraine's President Zelensky to BBC: Blood money being paid for Russian oil",
        style: titleStyle,
        maxLines:3,
        overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            Text("BBC",style: subTitle,),
            const Spacer(),
            Text("14 min ago",style: subTitle,),
          ],
        )
      ],
    );
  }
}

newsListView(){
  return SliverList(
    delegate: SliverChildBuilderDelegate(
        childCount: 10,
            (context,index){
          return const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: NewsTile(),
          );
        }
    ),
  );
}