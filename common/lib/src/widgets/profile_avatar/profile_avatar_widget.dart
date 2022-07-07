import 'package:flutter/material.dart';

class ProfileAvatarWidget extends StatefulWidget {
  final String avatar;
  final VoidCallback? changeAvatar;
  const ProfileAvatarWidget({
    Key? key,
    required this.avatar,
    required this.changeAvatar,
  }) : super(key: key);

  @override
  State<ProfileAvatarWidget> createState() => _ProfileAvatarWidgetState();
}

class _ProfileAvatarWidgetState extends State<ProfileAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
            image: widget.avatar.contains('assets')
                ? DecorationImage(image: AssetImage(widget.avatar))
                : DecorationImage(image: NetworkImage(widget.avatar)),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: GestureDetector(
            onTap: () => widget.changeAvatar?.call(),
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).backgroundColor,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(.1),
                    blurRadius: 5.0,
                    offset: const Offset(0.0, 5.0),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
