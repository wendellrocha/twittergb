import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'start_controller.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key? key, this.title = 'StartPage'}) : super(key: key);
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  final StartController controller = Modular.get();
  @override
  void initState() {
    super.initState();
    Modular.to.addListener(() {
      int index = controller.menuItems
          .map((e) => e.route)
          .toList()
          .indexWhere((element) => element == Modular.to.path);

      if (!index.isNegative) {
        controller.onTap(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: const [
          Expanded(child: RouterOutlet()),
          // Evitar que o botão fique acima de qualquer texto
          SizedBox(height: 1),
        ],
      ),
      floatingActionButton: FloatingActionButtonWidget(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),

        /// Chamando a rota do módulo *message* passando o forRoot como true
        /// para que o *Modular* abra o módulo no root navigator, fora do *RouteOutlet*
        callback: () => Modular.to.pushNamed('/message/create', forRoot: true),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: RxBuilder(
        builder: (_) => BottomNavigationBarWidget(
          items: controller.menuItems,
          currentIndex: controller.currentIndex,
          onTap: (int index) => controller.onTap(index),
        ),
      ),
    );
  }
}
