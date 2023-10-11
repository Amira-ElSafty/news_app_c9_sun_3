import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_sun_3/category/category_item.dart';
import 'package:flutter_app_news_c9_sun_3/model/category.dart';

class CategoryFragments extends StatelessWidget {
  static const String routeName = 'category-fragments';
  var categoriesList = Category.getCategories();
  Function onCategoryClick;

  CategoryFragments({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category \nof interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryClick(categoriesList[index]);
                    },
                    child: CategoryItem(
                        category: categoriesList[index], index: index));
              },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
