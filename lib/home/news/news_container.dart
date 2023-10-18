import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_sun_3/dialog_utils.dart';
import 'package:flutter_app_news_c9_sun_3/home/news/cubit/news_container_view_model.dart';
import 'package:flutter_app_news_c9_sun_3/home/news/cubit/states.dart';
import 'package:flutter_app_news_c9_sun_3/home/news/news_item.dart';
import 'package:flutter_app_news_c9_sun_3/model/SourceResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsContainer extends StatefulWidget {
  Source source;

  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsContainerViewModel viewModel = NewsContainerViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsContainerViewModel, NewsStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is MessageState) {
          DialogUtils.showLoading(context, state.message!);
        }
      },
      listenWhen: (previousState, newState) {
        if (newState is MessageState) {
          return true;
        }
        return false;
      },
      buildWhen: (previousState, newState) {
        if (newState is MessageState) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (state is NewsErrorState) {
          return Column(
            children: [
              Text(state.errorMessage!),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsBySourceId(widget.source.id ?? '');
                  },
                  child: Text("Try Again"))
            ],
          );
        } else if (state is NewsSuccuessState) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: state.newsList![index]);
            },
            itemCount: state.newsList!.length,
          );
        }
        return Container();
      },
    );
    // FutureBuilder<NewsResponse?>(
    //   future: ApiManager.getNewsBySourceId(source.id ?? ""),
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
    //           Text('Something went wrong'),
    //           ElevatedButton(onPressed: () {}, child: Text("Try Again"))
    //         ],
    //       );
    //     }
    //
    //     /// server
    //     if (snapshot.data?.status != 'ok') {
    //       return Column(
    //         children: [
    //           Text(snapshot.data?.message ?? ""),
    //           ElevatedButton(onPressed: () {}, child: Text("Try Again"))
    //         ],
    //       );
    //     }
    //     var newsList = snapshot.data?.articles ?? [];
    //     return ListView.builder(
    //       itemBuilder: (context, index) {
    //         return NewsItem(news: newsList[index]);
    //       },
    //       itemCount: newsList.length,
    //     );
    //   });
  }
}
