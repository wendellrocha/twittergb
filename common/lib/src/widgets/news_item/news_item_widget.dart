import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../models/news_model.dart';
import '../avatar/avatar_widget.dart';

class NewsItemWidget extends StatelessWidget {
  final NewsModel item;
  const NewsItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Container(
      width: size.width * 0.95,
      height: 120,
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
          AvatarWidget(imageUrl: item.user?.profilePicture),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.user?.name ?? 'Unknow user',
                  style: theme.textTheme.bodyText1,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Text(
                    item.message?.content ?? 'Unable to load message content.',
                    style: theme.textTheme.bodyText2,
                  ),
                ),
                Text(
                  timeago.format(item.message!.createdAt!),
                  style: theme.textTheme.bodyText2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
