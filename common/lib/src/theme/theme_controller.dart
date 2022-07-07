import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  static const themePrefKey = 'theme';
  final SharedPreferences _prefs;

  ThemeController(this._prefs) {
    _currentTheme = _prefs.getString(themePrefKey) ?? 'light';
  }

  String? _currentTheme;

  String? get currentTheme => _currentTheme;

  void setTheme(String theme) {
    _currentTheme = theme;
    notifyListeners();
    _prefs.setString(themePrefKey, theme);
  }

  String? getTheme() {
    return _prefs.getString(themePrefKey);
  }

  static ThemeController? of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ThemeControllerProvider>();
    return provider?.controller;
  }
}

class ThemeControllerProvider extends InheritedWidget {
  const ThemeControllerProvider({
    Key? key,
    required this.controller,
    required Widget child,
  }) : super(key: key, child: child);

  final ThemeController controller;

  @override
  bool updateShouldNotify(ThemeControllerProvider oldWidget) =>
      controller != oldWidget.controller;
}
