import 'package:bloc/bloc.dart';
import 'package:flutter_app_news_c9_sun_3/home/category/cubit/states.dart';
import 'package:flutter_app_news_c9_sun_3/repository/source/source_repository_contract.dart';

class CategoryDetailsViewModel extends Cubit<CategorySourceState> {
  SourceRepositoryContract repositoryContract;

  CategoryDetailsViewModel(this.repositoryContract)
      : super(SourceLoadingState());

  void getSourceByCategoryId(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await repositoryContract.getSources(categoryId);
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
