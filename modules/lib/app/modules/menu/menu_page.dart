import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'menu_controller.dart';

class MenuPage extends StatefulWidget {
  final String title;
  const MenuPage({Key? key, this.title = 'Menu'}) : super(key: key);
  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  final MenuController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: RxBuilder(
        builder: (_) => ListView(
          shrinkWrap: true,
          children: [
            DefaaultAAppBarWidget(
              title: controller.user?.name ?? 'Olá!',
              titleColor: Theme.of(context).textTheme.bodyText1!.color!,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(.1),
                    blurRadius: 5.0,
                    offset: const Offset(0.0, 5.0),
                  ),
                ],
              ),
              child: Center(
                child: ProfileAvatarWidget(
                  avatar: controller.user?.profilePicture ??
                      'assets/images/profile-avatar.png',
                  changeAvatar: controller.user != null
                      ? () async {
                          final response = await Utils.pickImage();
                          if (response != null) {
                            await controller.uploadImage(response['file']);
                          }
                        }
                      : null,
                ),
              ),
            ),
            if (controller.user != null) ...[
              ListTileWidget(
                useMargin: true,
                trailingIcon: Icons.edit_sharp,
                trailingIconSize: 21,
                onTap: () => Modular.to.pushNamed('edit-name', forRoot: true),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'Nome',
                        textAlign: TextAlign.start,
                        style: theme.textTheme.bodyText1,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        controller.user!.name!,
                        textAlign: TextAlign.start,
                        style: theme.textTheme.bodyText2!.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ListTileWidget(
                useMargin: true,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'Email',
                        textAlign: TextAlign.start,
                        style: theme.textTheme.bodyText1,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        controller.user!.email!,
                        textAlign: TextAlign.start,
                        style:
                            theme.textTheme.bodyText2!.copyWith(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              ListTileWidget(
                useMargin: true,
                onTap: () => controller.changePassword(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Text(
                        'Senha',
                        textAlign: TextAlign.start,
                        style: theme.textTheme.bodyText1,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Alterar',
                        textAlign: TextAlign.start,
                        style: theme.textTheme.bodyText2!.copyWith(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ListTileWidget(
                useMargin: true,
                trailingIcon: Icons.logout,
                trailingIconSize: 21,
                onTap: () async {
                  await controller.logout();
                  Modular.to.navigate('/start/home/');
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'Sair',
                        textAlign: TextAlign.start,
                        style: theme.textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            ListTileWidget(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 7,
                    child: Text(
                      'Modo noturno',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: AnimatedBuilder(
                      animation: ThemeController.of(context)!,
                      builder: (context, child) => SwitchWidget(
                        value:
                            ThemeController.of(context)?.getTheme() == 'dark',
                        showTitle: false,
                        onChanged: (bool value) {
                          ThemeController.of(context)
                              ?.setTheme(value ? 'dark' : 'light');
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
