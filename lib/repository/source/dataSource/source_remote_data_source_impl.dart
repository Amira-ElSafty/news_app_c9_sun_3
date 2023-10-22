import 'package:flutter_app_news_c9_sun_3/api/api_manger.dart';
import 'package:flutter_app_news_c9_sun_3/model/SourceResponse.dart';
import 'package:flutter_app_news_c9_sun_3/repository/source/source_repository_contract.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManager apiManager;

  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response;
  }
}

SourceRemoteDataSource injectSourceRemoteDataSource() {
  return SourceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
