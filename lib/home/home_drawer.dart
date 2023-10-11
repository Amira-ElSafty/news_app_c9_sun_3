import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 0;

  static const int settings = 1;

  Function onDrawerItemClick;

  HomeDrawer({required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.1),
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                'News App',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerItemClick(categories);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerItemClick(settings);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
