import 'package:flutter_app_news_c9_sun_3/model/NewsResponse.dart';

abstract class NewsRepositoryContract {
  Future<NewsResponse?> getNews(String sourceId);
}