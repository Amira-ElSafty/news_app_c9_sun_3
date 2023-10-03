import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_sun_3/home/home_screen.dart';
import 'package:flutter_app_news_c9_sun_3/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.lightTheme,
    );
  }
}
