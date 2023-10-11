import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_sun_3/category/category_details.dart';
import 'package:flutter_app_news_c9_sun_3/category/category_fragments.dart';
import 'package:flutter_app_news_c9_sun_3/home/home_drawer.dart';
import 'package:flutter_app_news_c9_sun_3/model/category.dart';
import 'package:flutter_app_news_c9_sun_3/my_theme.dart';
import 'package:flutter_app_news_c9_sun_3/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            'assets/images/main_background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              selectedSideItem == HomeDrawer.settings
                  ? 'Settings'
                  : selectedCategory == null
                      ? 'News App'
                      : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          drawer: Drawer(
            child: HomeDrawer(onDrawerItemClick: onSideItemClick),
          ),
          body: selectedSideItem == HomeDrawer.settings
              ? SettingTab()
              : selectedCategory == null
                  ? CategoryFragments(onCategoryClick: onCategoryClick)
                  : CategoryDetails(category: selectedCategory!),
        )
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryClick(Category category) {
    selectedCategory = category;
    setState(() {});
  }

  int selectedSideItem = HomeDrawer.categories;

  void onSideItemClick(int newsSelectedMenuItem) {
    selectedSideItem = newsSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
