import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class DefaaultAAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final double? elevation;
  final PreferredSizeWidget? bottom;
  final VoidCallback? callbackButton;
  const DefaaultAAppBarWidget({
    Key? key,
    required this.title,
    this.actions,
    this.elevation,
    this.bottom,
    this.callbackButton,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<DefaaultAAppBarWidget> createState() => _DefaaultAAppBarWidgetState();
}

class _DefaaultAAppBarWidgetState extends State<DefaaultAAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      actions: widget.actions,
      elevation: widget.elevation,
      bottom: widget.bottom,
      leading: Modular.to.canPop()
          ? Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Modular.to.pop(),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : null,
      title: Text(widget.title),
    );
  }
}
