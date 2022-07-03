import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

class AppWidget extends StatelessWidget {
  final ThemeController themeController;
  const AppWidget({Key? key, required this.themeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        return ThemeControllerProvider(
          controller: themeController,
          child: MaterialApp.router(
            title: 'TwitterGB',
            theme: _handleTheme(),
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
          ),
        );
      },
    );
  }

  ThemeData _handleTheme() {
    return themeController.currentTheme == 'dark'
        ? DarkTheme().themeData
        : LightTheme().themeData;
  }
}
