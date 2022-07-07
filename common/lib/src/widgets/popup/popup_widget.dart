import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../models/post/post_model.dart';

class PopupWidget extends StatelessWidget {
  final PostModel post;
  final VoidCallback deleteCallback;
  const PopupWidget({
    Key? key,
    required this.post,
    required this.deleteCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopupMenuButton(
      itemBuilder: (_) => [
        PopupMenuItem(
          value: 'delete',
          child: Row(
            children: [
              const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              const SizedBox(width: 10),
              Text(
                'Excluir post',
                style: theme.textTheme.bodyText1,
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: '/message/edit',
          child: Row(
            children: [
              Icon(
                Icons.edit,
                color: theme.textTheme.bodyText1!.color!,
              ),
              const SizedBox(width: 10),
              Text(
                'Editar post',
                style: theme.textTheme.bodyText1,
              )
            ],
          ),
        )
      ],
      onSelected: (value) {
        if (value == 'delete') {
          deleteCallback.call();
          return;
        }

        Modular.to.pushNamed(value as String, forRoot: true, arguments: post);
      },
      offset: const Offset(0, 15),
      elevation: 2,
      color: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(
        FontAwesomeIcons.ellipsis,
        color: theme.textTheme.bodyText2!.color!,
      ),
    );
  }
}
