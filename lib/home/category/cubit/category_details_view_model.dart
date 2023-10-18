import 'package:bloc/bloc.dart';
import 'package:flutter_app_news_c9_sun_3/api/api_manger.dart';
import 'package:flutter_app_news_c9_sun_3/home/category/cubit/states.dart';

class CategoryDetailsViewModel extends Cubit<CategorySourceState> {
  CategoryDetailsViewModel() : super(SourceLoadingState());

  void getSourceByCategoryId(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMessage: response!.message));
      } else {
        emit(SourceSuccuessState(sourceList: response?.sources));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: 'Error Loading sources list'));
    }
  }
}
