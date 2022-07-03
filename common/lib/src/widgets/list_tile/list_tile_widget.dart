import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double trailingIconSize;
  final double leadingIconSize;
  final Widget child;
  final VoidCallback? onTap;
  final bool useMargin;
  final Color? trailingIconColor;
  final Color? leadingIconColor;
  final double? height;

  const ListTileWidget({
    Key? key,
    required this.child,
    this.onTap,
    this.leadingIcon,
    this.trailingIcon,
    this.trailingIconSize = 14,
    this.leadingIconSize = 32,
    this.trailingIconColor,
    this.leadingIconColor,
    this.useMargin = false,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: height,
      padding: const EdgeInsets.all(0),
      margin: useMargin ? const EdgeInsets.only(bottom: 5) : null,
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(.1),
            blurRadius: 5.0,
            offset: const Offset(0.0, 5.0),
          ),
        ],
      ),
      child: ListTile(
        minLeadingWidth: 20,
        isThreeLine: false,
        trailing: trailingIcon != null
            ? Icon(
                trailingIcon,
                size: trailingIconSize,
                color: trailingIconColor ?? theme.textTheme.bodyText1!.color,
              )
            : null,
        leading: leadingIcon != null
            ? Icon(
                leadingIcon,
                size: leadingIconSize,
                color: leadingIconColor ?? theme.textTheme.bodyText1!.color,
              )
            : null,
        title: child,
        onTap: () => onTap?.call(),
      ),
    );
  }
}
