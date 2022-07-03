import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'news_controller.dart';
import 'news_store.dart';

class NewsPage extends StatefulWidget {
  final String title;
  const NewsPage({Key? key, this.title = 'Notícias'}) : super(key: key);
  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  final NewsController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScopedBuilder<NewsStore, HttpError, News>(
        store: controller.store,
        onLoading: (context) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        onError: (context, error) => Text(error!.message!),
        onState: (context, state) {
          if (state.isEmpty) {
            return const Center(
              child: NoContentWidget(
                text: 'Ainda não há notícias disponíveis.',
              ),
            );
          }
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) => NewsItemWidget(
              item: state[index],
            ),
          );
        },
      ),
    );
  }
}
