import 'package:asuka/asuka.dart' as asuka;
import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'create_account_controller.dart';
import 'states/create_account_form_state.dart';

class CreateAccountPage extends StatefulWidget {
  final String title;
  final String email;
  const CreateAccountPage({
    Key? key,
    this.title = 'Crie a sua conta',
    required this.email,
  }) : super(key: key);
  @override
  CreateAccountPageState createState() => CreateAccountPageState();
}

class CreateAccountPageState extends State<CreateAccountPage> {
  final CreateAccountController controller = Modular.get();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Variáveis reativas para os requisitos da senha
  final RxNotifier<bool> _hasLength = RxNotifier<bool>(false);
  final RxNotifier<bool> _hasSpecial = RxNotifier<bool>(false);
  final RxNotifier<bool> _hasUpperLetter = RxNotifier<bool>(false);
  final RxNotifier<bool> _hasSpace = RxNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: <Widget>[
          Image.asset(
            'assets/images/create-account.png',
            cacheWidth: 500,
            height: 280,
          ),
          Text(
            'Quase lá!',
            style: theme.textTheme.bodyText1!.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Para continuar, vamos precisar de algumas informações.',
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
                  controller: _nameController,
                  title: 'Nome',
                  inputType: TextInputType.name,
                  vMargin: 3,
                  validator: (String? value) => Validators.name(value),
                ),
                TextFieldWidget(
                  controller: _emailController,
                  title: 'Email',
                  inputType: TextInputType.emailAddress,
                  borderColor: Colors.black,
                  vMargin: 3,
                  validator: (String? value) => Validators.email(
                    value ?? _emailController.text,
                  ),
                ),
                TextFieldWidget(
                  controller: _passController,
                  title: 'Senha',
                  isPassword: true,
                  inputType: TextInputType.visiblePassword,
                  vMargin: 3,
                  maxLines: 1,
                  validator: (String? value) {
                    if (value != null) {
                      _hasLength.value = Validators.validateLength(value);
                      _hasSpecial.value = Validators.validateSpecialCase(value);
                      _hasUpperLetter.value =
                          Validators.validateUpperCase(value);
                      _hasSpace.value = Validators.validateSpace(value);
                    }

                    return Validators.password(value);
                  },
                ),
                RxBuilder(
                  builder: (_) => SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '• Mínimo de 8 dígitos entre letras e números',
                          style: theme.textTheme.bodyText2!.copyWith(
                            color: _hasLength.value
                                ? const Color(0xFF12AF7C)
                                : Colors.red,
                            // fontSize: 13,
                          ),
                        ),
                        Text(
                          '• Ao menos uma letra maiúscula',
                          style: theme.textTheme.bodyText2!.copyWith(
                            color: _hasUpperLetter.value
                                ? const Color(0xFF12AF7C)
                                : Colors.red,
                          ),
                        ),
                        Text(
                          '• Ao menos 1 caractere especial (@#\$%^)',
                          style: theme.textTheme.bodyText2!.copyWith(
                            color: _hasSpecial.value
                                ? const Color(0xFF12AF7C)
                                : Colors.red,
                          ),
                        ),
                        Text(
                          '• Não conter espaços',
                          style: theme.textTheme.bodyText2!.copyWith(
                            color: _hasSpace.value
                                ? Colors.red
                                : const Color(0xFF12AF7C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                TextFieldWidget(
                  controller: _confirmPassController,
                  title: 'Confirme sua senha',
                  inputType: TextInputType.visiblePassword,
                  isPassword: true,
                  vMargin: 3,
                  maxLines: 1,
                  validator: (String? value) => Validators.comparePasswords(
                    value,
                    _passController.text,
                  ),
                ),
                const SizedBox(height: 20),
                RxBuilder(
                  builder: (_) => SolidButtonWidget(
                    title: 'Criar conta',
                    showProgress: controller.isLoading,
                    callback: () => _handleButton(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleButton() async {
    if (_formKey.currentState!.validate()) {
      final state = CreateAccountFormState(
        name: _nameController.text,
        email: _emailController.text,
        password: _passController.text,
      );

      bool result = await controller.submit(state);
      if (result) {
        asuka
            .showDialog(
              builder: (context) => const WarnModalWidget(
                assetImage: 'assets/images/ok.png',
                buttonText: 'Ok',
                title: 'Ok!',
                text: 'Cadastro realizado com sucesso!'
                    ' Agora você precisa fazer o login para continuar.',
              ),
            )
            .then(
              (value) => Modular.to.pushReplacementNamed(
                '../login/${_emailController.text}',
              ),
            );
      }
    }
  }
}
