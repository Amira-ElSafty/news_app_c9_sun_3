import 'package:bloc/bloc.dart';
import 'package:flutter_app_news_c9_sun_3/api/api_manger.dart';
import 'package:flutter_app_news_c9_sun_3/home/news/cubit/states.dart';

class NewsContainerViewModel extends Cubit<NewsStates> {
  NewsContainerViewModel() : super(NewsLoadingState());

  void getNewsBySourceId(String sourceId) async {
    try {
      emit(MessageState(message: 'Loading...'));
      emit(NewsLoadingState());
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        emit(NewsErrorState(errorMessage: response!.message));
      } else {
        emit(NewsSuccuessState(newsList: response!.articles));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: 'News Error Loading '));
    }
  }
}
