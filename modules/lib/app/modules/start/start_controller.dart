import 'package:common/common.dart';

import 'start_store.dart';

class StartController {
  final StartStore _store;

  StartController(this._store);

  MenuItems get menuItems => _store.menuItems;
  int get currentIndex => _store.currentIndex;

  void onTap(int index) => _store.onTap(index);
}
