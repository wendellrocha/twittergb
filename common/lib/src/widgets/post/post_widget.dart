import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../models/post/post_model.dart';
import '../../stores/user_store.dart';
import '../avatar/avatar_widget.dart';
import '../popup/popup_widget.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;
  final String? profileImage;
  final VoidCallback deleteCallback;
  const PostWidget({
    Key? key,
    required this.post,
    required this.deleteCallback,
    this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return IntrinsicHeight(
      child: Container(
        width: size.width * 0.95,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvatarWidget(imageUrl: post.user?.profilePicture),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.user?.name ?? 'Unknow user',
                    style: theme.textTheme.bodyText1,
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: Text(
                      post.message ?? 'Unable to load message content.',
                      style: theme.textTheme.bodyText1!.copyWith(fontSize: 13),
                    ),
                  ),
                  RxBuilder(
                    builder: (_) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: !(Modular.get<UserStore>().user?.userId ==
                                  post.user?.userId)
                              ? const EdgeInsets.only(top: 10.0)
                              : EdgeInsets.zero,
                          child: Text(
                            timeago.format(post.editedAt!, locale: 'pt_BR'),
                            style: theme.textTheme.bodyText2,
                          ),
                        ),
                        if (Modular.get<UserStore>().user?.userId ==
                            post.user?.userId)
                          PopupWidget(
                            post: post,
                            deleteCallback: deleteCallback,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
