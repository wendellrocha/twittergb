import 'package:asuka/asuka.dart' as asuka;
import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';

class HomeStore extends StreamStore<FirestoreError, Posts> {
  final FirebaseFirestoreService _firestoreService;
  HomeStore(this._firestoreService) : super(Posts.empty());

  void getAllPostsStream() async {
    setLoading(true);
    final response = await _firestoreService.getAllPostsStream();
    response.fold(setError, (stream) {
      stream.listen((posts) {
        Posts items = [
          for (var post in posts.docs)
            PostModel.fromFirestore(post.reference.id, post.data())
        ];
        update(items, force: true);
      });
    });
    setLoading(false);
  }

  void deletePost(String id) async {
    final response = await _firestoreService.deletePost(id);
    return response.fold((l) {
      asuka.showDialog(
        builder: (context) => const WarnModalWidget(
          title: 'Ooops!',
          text: 'Não foi possível excluir o post'
              ' no momento. Por favor, tente novamente.',
        ),
      );
    }, (r) => true);
  }
}
