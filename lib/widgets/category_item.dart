// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:newsify/theme/theme.dart';

class CategoryItem extends StatefulWidget {
  final String title;
  final bool isTapped;
  const CategoryItem({
    Key? key,
    required this.title,
    required this.isTapped,
  }) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 32,
        width: 95,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey),
            color:widget.isTapped? primaryColor : Colors.white,
            ),
        child: Center(child: Text(widget.title, style: widget.isTapped? smallTitleStyle : titleStyle)),
      ),
    );
  }

  ListView categoriesListView() {
  int selectedIndex = 0;
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



  List<String> categoriesModel = [
  "General",
  "Business",
  "Health",
  "Science",
  "Sports",
  "Technology"
];
