import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_sun_3/my_theme.dart';

class Category {
  String id;

  String title;

  String image;

  Color color;

  Category(
      {required this.id,
      required this.title,
      required this.image,
      required this.color});

  static List<Category> getCategories() {
    return [
      Category(
          id: 'sports',
          title: 'Sports',
          image: 'assets/images/sports.png',
          color: MyTheme.redColor),
      Category(
          id: 'health',
          title: 'Health',
          image: 'assets/images/health.png',
          color: MyTheme.pinkColor),
      Category(
          id: 'business',
          title: 'Business',
          image: 'assets/images/bussines.png',
          color: MyTheme.brownColor),
      Category(
          id: 'science',
          title: 'Science',
          image: 'assets/images/science.png',
          color: MyTheme.yellowColor),
      Category(
          id: 'general',
          title: 'General',
          image: 'assets/images/general.png',
          color: MyTheme.blueColor),
      Category(
          id: 'entertainment',
          title: 'Entertainment',
          image: 'assets/images/entertainment.png',
          color: MyTheme.darkBlueColor),
      Category(
          id: 'technology',
          title: 'Technology',
          image: 'assets/images/technology.png',
          color: MyTheme.redColor),
    ];
  }
}
