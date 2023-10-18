import 'package:flutter_app_news_c9_sun_3/model/SourceResponse.dart';

abstract class CategorySourceState {}

class SourceInitialState extends CategorySourceState {}

class SourceLoadingState extends CategorySourceState {}

class SourceErrorState extends CategorySourceState {
  String? errorMessage;

  SourceErrorState({required this.errorMessage});
}

class SourceSuccuessState extends CategorySourceState {
  List<Source>? sourceList;

  SourceSuccuessState({required this.sourceList});
}
