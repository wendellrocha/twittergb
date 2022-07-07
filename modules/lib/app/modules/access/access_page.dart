import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'access_controller.dart';
import 'access_state.dart';

class AccessPage extends StatefulWidget {
  final String title;
  const AccessPage({Key? key, this.title = 'Acesse sua conta'})
      : super(key: key);
  @override
  AccessPageState createState() => AccessPageState();
}

class AccessPageState extends State<AccessPage> {
  final AccessController controller = Modular.get();

  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: DefaaultAAppBarWidget(
        title: widget.title,
        backgroundColor: Colors.transparent,
        titleColor: theme.textTheme.bodyText1!.color,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Image.asset(
            'assets/images/conversation.png',
            width: 500,
          ),
          Text(
            'Olá,',
            style: theme.textTheme.bodyText1!.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'o TwitterGB é um espaço para você conversar e compartilhar'
            ' ideias com os seus colegas.',
            textWidthBasis: TextWidthBasis.parent,
            style: theme.textTheme.bodyText1!.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'para continuar, informe o seu e-mail',
            style: theme.textTheme.bodyText1!.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldWidget(
                  controller: _emailController,
                  title: 'Email',
                  inputType: TextInputType.emailAddress,
                  validator: (String? value) => Validators.email(value),
                ),
                const SizedBox(height: 20),
                SolidButtonWidget(
                  title: 'Continuar',
                  callback: () => _handleButton(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleButton() async {
    if (_formKey.currentState!.validate()) {
      AccessState state = await controller.submit(_emailController.text);

      if (state.hasAccount && state.isFormValidated) {
        Modular.to.pushNamed('login/${_emailController.text}');
        return;
      }

      if (!state.hasAccount && state.isFormValidated) {
        Modular.to.pushNamed(
          'create-account' '/${_emailController.text}',
        );

        return;
      }
    }
  }
}
