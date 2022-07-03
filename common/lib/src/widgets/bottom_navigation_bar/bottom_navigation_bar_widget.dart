import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../typedefs/typedefs.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final MenuItems items;
  final int currentIndex;
  final Function(int) onTap;
  const BottomNavigationBarWidget({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    required this.onTap,
  })  : assert(currentIndex >= 0, 'Invalid index'),
        super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomBarHeight,
      child: BottomAppBar(
        elevation: 4,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).backgroundColor,
        notchMargin: 5,
        child: SafeArea(
          child: SizedBox(
            height: kBottomBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: _builder(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _builder() {
    final itemCount = widget.items.length;

    List<Widget> items = [];

    for (int i = 0; i < itemCount; i++) {
      items.add(
        Expanded(
          child: SizedBox(
            height: kBottomBarHeight,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => widget.onTap(i),
                child: Icon(
                  widget.items[i].icon,
                  color: widget.currentIndex == i
                      ? Theme.of(context).primaryColor
                      : null,
                ),
              ),
            ),
          ),
        ),
      );

      if (i == itemCount - 1) {
        // Adiciona um gap entre o fab e os itens
        items.add(const SizedBox(width: 72));
      }
    }

    return items;
  }
}
