import 'package:flutter_app_news_c9_sun_3/model/NewsResponse.dart';

abstract class NewsStates {}

/// build
class NewsLoadingState extends NewsStates {}

class NewsErrorState extends NewsStates {
  String? errorMessage;

  NewsErrorState({required this.errorMessage});
}

class NewsSuccuessState extends NewsStates {
  List<News>? newsList;

  NewsSuccuessState({required this.newsList});
}

/// action
class MessageState extends NewsStates {
  String? message;

  MessageState({required this.message});
}
