import 'package:flutter_app_news_c9_sun_3/api/api_manger.dart';
import 'package:flutter_app_news_c9_sun_3/model/NewsResponse.dart';
import 'package:flutter_app_news_c9_sun_3/repository/news_data_source.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponse?> getNews(String sourceId) async {
    var response = await apiManager.getNewsBySourceId(sourceId);
    return response;
  }
}

NewsRemoteDataSource injectNewsRemoteDataSource() {
  return NewsRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
