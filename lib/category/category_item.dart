import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_sun_3/model/category.dart';
import 'package:flutter_app_news_c9_sun_3/my_theme.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;

  CategoryItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(index % 2 == 0 ? 18 : 0),
              bottomRight: Radius.circular(index % 2 == 0 ? 0 : 18))),
      child: Column(
        children: [
          Image.asset(
            category.image,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: MyTheme.whiteColor),
          )
        ],
      ),
    );
  }
}
