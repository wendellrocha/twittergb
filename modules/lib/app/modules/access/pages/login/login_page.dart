import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  final String email;
  const LoginPage({
    Key? key,
    this.title = 'Entre na sua conta',
    required this.email,
  }) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginController controller = Modular.get();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: DefaaultAAppBarWidget(
        title: widget.title,
        titleColor: theme.textTheme.bodyText1?.color,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Image.asset(
            'assets/images/login.png',
            cacheWidth: 500,
            height: 300,
          ),
          Text(
            'Olá, seja bem-vindo!\nSentimos a sua falta',
            style: theme.textTheme.bodyText1!.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Para continuar, informe os seus dados de acesso',
            textWidthBasis: TextWidthBasis.parent,
            style: theme.textTheme.bodyText1!.copyWith(
              fontSize: 18,
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
                  borderColor: Colors.black,
                  vMargin: 3,
                  validator: (String? value) => Validators.email(value),
                ),
                TextFieldWidget(
                  controller: _passController,
                  title: 'Senha',
                  isPassword: true,
                  inputType: TextInputType.visiblePassword,
                  vMargin: 3,
                  maxLines: 1,
                  validator: (String? value) => Validators.passwordEmpty(value),
                ),
                const SizedBox(height: 20),
                RxBuilder(
                  builder: (_) => SolidButtonWidget(
                    title: 'Entrar',
                    showProgress: controller.isLoading,
                    callback: () => _handleButton(),
                  ),
                ),
                const SizedBox(height: 20),
                RxBuilder(
                  builder: (_) => SolidButtonWidget(
                    buttonColor: Colors.transparent,
                    useUpperCase: false,
                    showShadow: false,
                    title: 'Esqueci a minha senha',
                    fontColor: theme.primaryColor,
                    callback: () {
                      if (_emailController.text.isNotEmpty) {
                        controller.changePassword(_emailController.text);
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleButton() async {
    bool result = await controller.submit(
      _emailController.text,
      _passController.text,
    );

    if (result) {
      final route = await controller.getRoute();
      if (route.isEmpty) {
        Modular.to.navigate('/start/home/');
        return;
      } else {
        Modular.to.navigate(route);
      }
    }
  }
}
