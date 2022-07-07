import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'edit_name_controller.dart';

class EditNamePage extends StatefulWidget {
  final String title;
  const EditNamePage({Key? key, this.title = 'Editar nome'}) : super(key: key);

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  final EditNameController controller = Modular.get();

  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: DefaaultAAppBarWidget(title: widget.title),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.asset(
            'assets/images/profile.png',
            cacheWidth: 500,
            height: 300,
          ),
          Text(
            'Como gostaria de ser chamado?',
            textWidthBasis: TextWidthBasis.parent,
            style: theme.textTheme.bodyText1!.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFieldWidget(
                  title: 'Nome',
                  controller: TextEditingController(),
                  validator: (String? value) => Validators.name(value),
                ),
                const SizedBox(height: 20),
                SolidButtonWidget(
                  title: 'Alterar',
                  callback: () async {
                    if (_formKey.currentState!.validate()) {
                      await controller.updateUsername(_nameController.text);
                      Modular.to.pop();
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
