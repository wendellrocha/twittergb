import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'splash_store.dart';

class SplashPage extends StatefulWidget {
  final String title;
  final String splashIcon;
  const SplashPage({
    Key? key,
    this.title = 'SplashPage',
    required this.splashIcon,
  }) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Modular.to.navigate('/start/home/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(widget.splashIcon, width: 50),
      ),
    );
  }
}
