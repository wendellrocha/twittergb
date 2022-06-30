import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'splash_store.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Modular.to.navigate('/home/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 150,
        ),
      ),
    );
  }
}
