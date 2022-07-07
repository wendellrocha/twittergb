import 'package:asuka/asuka.dart' as asuka;
import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'app_controller.dart';
import 'app_module.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

class AppWidget extends StatefulWidget {
  final ThemeController themeController;
  const AppWidget({Key? key, required this.themeController}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final AppController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    Modular.setObservers([asuka.asukaHeroController]);
    Modular.isModuleReady<AppModule>();
    controller.listenUserChanges();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.themeController,
      builder: (context, _) {
        return ThemeControllerProvider(
          controller: widget.themeController,
          child: MaterialApp.router(
            title: 'TwitterGB',
            theme: _handleTheme(),
            builder: asuka.builder,
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
          ),
        );
      },
    );
  }

  ThemeData _handleTheme() {
    return widget.themeController.currentTheme == 'dark'
        ? DarkTheme().themeData
        : LightTheme().themeData;
  }
}
