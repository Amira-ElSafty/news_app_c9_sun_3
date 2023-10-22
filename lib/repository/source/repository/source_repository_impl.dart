import 'package:flutter_app_news_c9_sun_3/model/SourceResponse.dart';
import 'package:flutter_app_news_c9_sun_3/repository/source/dataSource/source_remote_data_source_impl.dart';
import 'package:flutter_app_news_c9_sun_3/repository/source/source_repository_contract.dart';

class SourceRepositoryImpl implements SourceRepositoryContract {
  SourceRemoteDataSource remoteDataSource;

  SourceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) {
    return remoteDataSource.getSources(categoryId);
  }
}

SourceRepositoryContract injectSourceRepositoryContract() {
  return SourceRepositoryImpl(remoteDataSource: injectSourceRemoteDataSource());
}
