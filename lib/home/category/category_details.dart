import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_sun_3/home/category/cubit/category_details_view_model.dart';
import 'package:flutter_app_news_c9_sun_3/home/category/cubit/states.dart';
import 'package:flutter_app_news_c9_sun_3/home/tab/tab_container.dart';
import 'package:flutter_app_news_c9_sun_3/model/category.dart';
import 'package:flutter_app_news_c9_sun_3/repository/source/repository/source_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category-details';
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel =
      CategoryDetailsViewModel(injectSourceRepositoryContract());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourceByCategoryId(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, CategorySourceState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SourceLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (state is SourceErrorState) {
            return Column(
              children: [
                Text(state.errorMessage!),
                ElevatedButton(onPressed: () {}, child: Text("Try Again"))
              ],
            );
          } else if (state is SourceSuccuessState) {
            return TabContainer(
              sourcesList: state.sourceList!,
            );
          }
          return Container();
        });
    // FutureBuilder<SourceResponse?>(
    //   future: ApiManager.getSources(widget.category.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: Theme.of(context).primaryColor,
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text("Something went wrong"),
    //           ElevatedButton(onPressed: () {}, child: Text("Try Again"))
    //         ],
    //       );
    //     }
    //
    //     /// server (success , error)
    //     if (snapshot.data?.status != 'ok') {
    //       /// error , message , code
    //       return Column(
    //         children: [
    //           Text(snapshot.data?.message ?? ''),
    //           ElevatedButton(onPressed: () {}, child: Text("Try Again"))
    //         ],
    //       );
    //     }
    //     var sourcesList = snapshot.data?.sources ?? [];
    //     return TabContainer(
    //       sourcesList: sourcesList,
    //     );
    //   });
  }
}
