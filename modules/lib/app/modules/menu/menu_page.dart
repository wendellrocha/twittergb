import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'menu_controller.dart';

class MenuPage extends StatefulWidget {
  final String title;
  const MenuPage({Key? key, this.title = 'Menu'}) : super(key: key);
  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  final MenuController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaaultAAppBarWidget(title: widget.title),
      body: ListView(
        padding: const EdgeInsets.only(top: 8),
        shrinkWrap: true,
        children: [
          ListTileWidget(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 10,
                  child: Text(
                    'Modo noturno',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Flexible(
                  child: AnimatedBuilder(
                    animation: ThemeController.of(context)!,
                    builder: (context, child) => SwitchWidget(
                      value: ThemeController.of(context)?.getTheme() == 'dark',
                      showTitle: false,
                      onChanged: (bool value) {
                        // controller.isDarkTheme = value;
                        ThemeController.of(context)
                            ?.setTheme(value ? 'dark' : 'light');
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
