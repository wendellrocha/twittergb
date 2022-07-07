import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.getAllPostsStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaaultAAppBarWidget(title: widget.title),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ScopedBuilder<HomeStore, FirestoreError, Posts>(
              store: controller.store,
              onLoading: (context) => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              onError: (context, error) => NoContentWidget(
                text: error!.message,
              ),
              onState: (context, state) {
                if (state.isEmpty) {
                  return const Center(
                    child: NoContentWidget(
                      text: 'Ainda não há posts publicados.',
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) => PostWidget(
                    post: state[index],
                    deleteCallback: () => controller.deletePost(
                      state[index].id!,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
