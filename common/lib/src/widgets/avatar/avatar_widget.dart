import 'package:flutter/material.dart';

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
          image: NetworkImage(
            imageUrl ?? 'https://i.pravatar.cc/300',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
