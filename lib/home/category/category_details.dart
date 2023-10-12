import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_sun_3/api/api_manger.dart';
import 'package:flutter_app_news_c9_sun_3/home/tab/tab_container.dart';
import 'package:flutter_app_news_c9_sun_3/model/SourceResponse.dart';
import 'package:flutter_app_news_c9_sun_3/model/category.dart';

class CategoryDetails extends StatelessWidget {
  static const String routeName = 'category-details';
  Category category;

  CategoryDetails({required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text("Something went wrong"),
                ElevatedButton(onPressed: () {}, child: Text("Try Again"))
              ],
            );
          }

          /// server (success , error)
          if (snapshot.data?.status != 'ok') {
            /// error , message , code
            return Column(
              children: [
                Text(snapshot.data?.message ?? ''),
                ElevatedButton(onPressed: () {}, child: Text("Try Again"))
              ],
            );
          }
          var sourcesList = snapshot.data?.sources ?? [];
          return TabContainer(
            sourcesList: sourcesList,
          );
        });
  }
}
