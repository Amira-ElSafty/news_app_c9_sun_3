import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_sun_3/model/NewsResponse.dart';
import 'package:flutter_app_news_c9_sun_3/my_theme.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            news.author ?? "",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: MyTheme.greyColor, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            news.title ?? "",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            news.publishedAt ?? "",
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: MyTheme.greyColor, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
