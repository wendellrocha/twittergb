import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'message_store.dart';

class MessagePage extends StatefulWidget {
  final MessageType type;
  final String title;
  const MessagePage({
    Key? key,
    this.title = 'MessagePage',
    required this.type,
  }) : super(key: key);
  @override
  MessagePageState createState() => MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  final MessageStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    widget.type.log();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaaultAAppBarWidget(title: widget.title),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}
