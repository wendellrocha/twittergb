import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'message_controller.dart';

class MessagePage extends StatefulWidget {
  final MessageType type;
  final String title;
  final PostModel? post;
  const MessagePage({
    Key? key,
    this.title = 'Mensagens',
    required this.type,
    this.post,
  }) : super(key: key);
  @override
  MessagePageState createState() => MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  final MessageController controller = Modular.get();

  final RxNotifier<bool> _isEmpty = RxNotifier<bool>(true);
  final TextEditingController _postController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      _postController.text = widget.post!.message!;
      _isEmpty.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: DefaaultAAppBarWidget(
        title: widget.type == MessageType.create
            ? 'Adicionar mensagem'
            : 'Editar mensagem',
        callbackButton: Modular.to.canPop()
            ? null
            : () {
                Modular.to.navigate('/start/home/');
              },
      ),
      floatingActionButton: RxBuilder(
        builder: (_) => FloatingActionButton(
          elevation: 0,
          backgroundColor: !_isEmpty.value
              ? theme.primaryColor
              : theme.primaryColor.withOpacity(0.5),
          onPressed: !_isEmpty.value ? () => _handleButton() : null,
          child: Icon(
            Icons.check,
            color:
                !_isEmpty.value ? Colors.white : Colors.white.withOpacity(0.5),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          TextFieldWidget(
            controller: _postController,
            height: MediaQuery.of(context).size.height * 0.35,
            inputType: TextInputType.multiline,
            hint: 'O que você está pensando?',
            borderColor: Colors.transparent,
            onChanged: (String value) {
              _isEmpty.value = value.isEmpty;
            },
            expands: true,
            maxLines: null,
            maxLength: 280,
            shadow: false,
          ),
        ],
      ),
    );
  }

  void _handleButton() async {
    FocusScope.of(context).unfocus();
    if (widget.type == MessageType.create) {
      final response = await controller.addPost(_postController.text);
      if (response) {
        if (Modular.to.canPop()) {
          Modular.to.pop();
          return;
        }
        Modular.to.navigate('/start/home/');
      }
      return;
    }

    final response = await controller.updatePost(
      widget.post!,
      _postController.text,
    );
    if (response) {
      if (Modular.to.canPop()) {
        Modular.to.pop();
        return;
      }
      Modular.to.navigate('/start/home/');
    }
  }
}
