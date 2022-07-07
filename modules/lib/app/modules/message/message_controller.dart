import 'package:asuka/asuka.dart' as asuka;
import 'package:common/common.dart';

class MessageController {
  final FirebaseFirestoreService _firestoreService;
  final UserStore _userStore;

  MessageController(this._firestoreService, this._userStore);

  Future<bool> addPost(String message) async {
    final date = DateTime.now();
    final post = PostModel(
      message: message,
      createdAt: date.toUtc(),
      editedAt: date.toUtc(),
      user: _userStore.user,
    );

    final response = await _firestoreService.addPost(post);
    return response.fold(
      (l) {
        asuka.showDialog(
          builder: (context) => WarnModalWidget(
            title: 'Ooops!',
            text: l.message,
          ),
        );
        return false;
      },
      (r) => r,
    );
  }

  Future updatePost(PostModel post, String message) async {
    final date = DateTime.now();
    final updatedPost = post.copyWith(
      message: message,
      editedAt: date,
    );

    final response = await _firestoreService.updatePost(updatedPost);
    return response.fold(
      (l) {
        asuka.showDialog(
          builder: (context) => WarnModalWidget(
            title: 'Ooops!',
            text: l.message,
          ),
        );
        return false;
      },
      (r) => r,
    );
  }
}
