import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class AvatarWidget extends StatelessWidget {
  final String? imageUrl;
  const AvatarWidget({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? profilePictureUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
