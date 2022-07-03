import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'access_store.dart';

class AccessPage extends StatefulWidget {
  final String title;
  const AccessPage({Key? key, this.title = 'AccessPage'}) : super(key: key);
  @override
  AccessPageState createState() => AccessPageState();
}

class AccessPageState extends State<AccessPage> {
  final AccessStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}
