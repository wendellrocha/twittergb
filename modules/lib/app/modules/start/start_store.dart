import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class StartStore extends NotifierStore<Exception, int> {
  StartStore() : super(0);

  final RxNotifier<int> _currentIndex = RxNotifier<int>(0);

  final MenuItems _menuItems = List.unmodifiable(
    [
      const MenuItemModel(
        icon: Icons.home,
        route: '/start/home/',
      ),
      const MenuItemModel(
        icon: Icons.library_books,
        route: '/start/news/',
      ),
      const MenuItemModel(
        icon: Icons.menu,
        route: '/start/menu/',
      )
    ],
  );

  MenuItems get menuItems => _menuItems;
  int get currentIndex => _currentIndex.value;

  void onTap(int index) {
    if (index > _menuItems.length) return;
    _currentIndex.value = index;
    Modular.to.navigate(_menuItems[index].route);
  }
}
