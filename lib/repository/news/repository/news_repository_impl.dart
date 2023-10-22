import 'package:flutter_app_news_c9_sun_3/model/NewsResponse.dart';
import 'package:flutter_app_news_c9_sun_3/repository/news/dataSource/news_remote_data_source.dart';
import 'package:flutter_app_news_c9_sun_3/repository/news/news_repository.dart';
import 'package:flutter_app_news_c9_sun_3/repository/news_data_source.dart';

class NewsRepositoryImpl implements NewsRepositoryContract {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NewsResponse?> getNews(String sourceId) {
    return remoteDataSource.getNews(sourceId);
  }
}

NewsRepositoryContract injectNewsRepositoryContract() {
  return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
}
