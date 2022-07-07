## Setup
Para executar o projeto e/ou gerar builds é necessário instalar o [just](https://github.com/casey/just) ou o [make](https://community.chocolatey.org/packages/make)

Após instalar, entrar no diretório `twittergb`

```pwsh
just get ou make get # resolver as dependências
just run ou make run # rodar em desenvolvimento ou simplesmente usar o f5/ctrl + f5 no vscode
just build_apk ou make build_apk # gerar apks
just build_bundle ou make build_bundle # gerar appbundle
```

## Sobre o projeto
### Arquitetura
 - O entrypoint do projeto é o [twittergb](/twittergb).
 - No [dependencies](/dependencies) estão todas as dependências externas do app (pacotes do [pub](pub.dev))
 - No [common](/common) está tudo o que é comum no app. Por exemplo, cliente http, models, stores globais, services...

### Serviços utilizados
No projeto foram utilizados alguns serviços do Firebase, que são:
- Firebase Authentication
- Firebase Storage
- Firebase Firestore

As políticas de segurança do Storage e do Firestore estão permitindo a leitura com o usuário deslogado, mas o insert, update ou delete apenas por usuários autenticados.

A troca do nome do usuário é permitida, mas não irá refletir nos posts antigos, apenas nos novos. O motivo dessa escolha consiste no fato do Firestore não permitir aggregations, por isso deveriam ser feitas no dispositivo o que pode levar a gargalos e demoras para exibir e/ou editar posts.

A ao criar uma mensagem (post), é enviado um snapshot do usuário logado. Caso o mesmo não tenha alterado a foto do perfil, o post ficará uma foto de perfil padrão e ela não é atualizada no usuário do post.

O aplicativo está configurado para rodar apenas no Android.


## Árvore de pastas

```
.
├── README.md
├── common
│   ├── CHANGELOG.md
│   ├── LICENSE
│   ├── README.md
│   ├── analysis_options.yaml
│   ├── common.iml
│   ├── lib
│   │   ├── common.dart
│   │   └── src
│   │       ├── adapters
│   │       │   ├── dio_adapter.dart
│   │       │   └── http_client_adapter.dart
│   │       ├── constants
│   │       │   └── constants.dart
│   │       ├── errors
│   │       │   ├── auth_error.dart
│   │       │   ├── failure.dart
│   │       │   ├── firestore_error.dart
│   │       │   └── storage_error.dart
│   │       ├── guards
│   │       │   └── auth_guard.dart
│   │       ├── http
│   │       │   ├── errors
│   │       │   │   └── http_error.dart
│   │       │   ├── interceptors
│   │       │   │   └── dio_interceptor.dart
│   │       │   └── response
│   │       │       └── http_response.dart
│   │       ├── models
│   │       │   ├── menu_item_model.dart
│   │       │   ├── news_message_model.dart
│   │       │   ├── news_model.dart
│   │       │   ├── post
│   │       │   │   └── post_model.dart
│   │       │   └── user_model.dart
│   │       ├── services
│   │       │   ├── firebase_auth_service.dart
│   │       │   ├── firebase_firestore_service.dart
│   │       │   ├── firebase_storage_service.dart
│   │       │   └── shared_preferences_service.dart
│   │       ├── stores
│   │       │   └── user_store.dart
│   │       ├── theme
│   │       │   └── theme_controller.dart
│   │       ├── typedefs
│   │       │   └── typedefs.dart
│   │       ├── types
│   │       │   └── message_type.dart
│   │       ├── utils
│   │       │   └── utils.dart
│   │       ├── validators
│   │       │   └── validators.dart
│   │       └── widgets
│   │           ├── avatar
│   │           │   └── avatar_widget.dart
│   │           ├── border_button
│   │           │   └── border_button_widget.dart
│   │           ├── bottom_navigation_bar
│   │           │   └── bottom_navigation_bar_widget.dart
│   │           ├── deafault_app_bar
│   │           │   └── default_app_bar_widget.dart
│   │           ├── floating_action_button
│   │           │   └── floating_action_button_widget.dart
│   │           ├── list_tile
│   │           │   └── list_tile_widget.dart
│   │           ├── news_item
│   │           │   └── news_item_widget.dart
│   │           ├── no_content
│   │           │   └── no_content_widget.dart
│   │           ├── options_modal
│   │           │   └── options_modal_widget.dart
│   │           ├── popup
│   │           │   └── popup_widget.dart
│   │           ├── post
│   │           │   └── post_widget.dart
│   │           ├── profile_avatar
│   │           │   └── profile_avatar_widget.dart
│   │           ├── progress
│   │           │   └── progress_widget.dart
│   │           ├── solid_button
│   │           │   └── solid_button_widget.dart
│   │           ├── switch
│   │           │   └── switch_widget.dart
│   │           ├── text_field
│   │           │   ├── text_field_store.dart
│   │           │   └── text_field_widget.dart
│   │           └── warn_modal
│   │               └── warn_modal_widget.dart
│   ├── pubspec.lock
│   └── pubspec.yaml
├── dependencies
│   ├── CHANGELOG.md
│   ├── LICENSE
│   ├── README.md
│   ├── analysis_options.yaml
│   ├── dependencies.iml
│   ├── lib
│   │   └── dependencies.dart
│   ├── pubspec.lock
│   └── pubspec.yaml
├── modules
│   ├── CHANGELOG.md
│   ├── LICENSE
│   ├── README.md
│   ├── analysis_options.yaml
│   ├── lib
│   │   ├── app
│   │   │   └── modules
│   │   │       ├── access
│   │   │       │   ├── access_controller.dart
│   │   │       │   ├── access_module.dart
│   │   │       │   ├── access_page.dart
│   │   │       │   ├── access_state.dart
│   │   │       │   ├── access_store.dart
│   │   │       │   └── pages
│   │   │       │       ├── create_account
│   │   │       │       │   ├── create_account_controller.dart
│   │   │       │       │   ├── create_account_page.dart
│   │   │       │       │   ├── create_account_store.dart
│   │   │       │       │   └── states
│   │   │       │       │       └── create_account_form_state.dart
│   │   │       │       └── login
│   │   │       │           ├── login_controller.dart
│   │   │       │           ├── login_page.dart
│   │   │       │           └── login_store.dart
│   │   │       ├── home
│   │   │       │   ├── home_controller.dart
│   │   │       │   ├── home_module.dart
│   │   │       │   ├── home_page.dart
│   │   │       │   └── home_store.dart
│   │   │       ├── menu
│   │   │       │   ├── menu_controller.dart
│   │   │       │   ├── menu_module.dart
│   │   │       │   ├── menu_page.dart
│   │   │       │   ├── menu_store.dart
│   │   │       │   └── pages
│   │   │       │       ├── edit_name.dart
│   │   │       │       └── edit_name_controller.dart
│   │   │       ├── message
│   │   │       │   ├── message_controller.dart
│   │   │       │   ├── message_module.dart
│   │   │       │   ├── message_page.dart
│   │   │       │   └── message_store.dart
│   │   │       ├── news
│   │   │       │   ├── news_controller.dart
│   │   │       │   ├── news_module.dart
│   │   │       │   ├── news_page.dart
│   │   │       │   ├── news_store.dart
│   │   │       │   └── repositories
│   │   │       │       └── news_repository.dart
│   │   │       ├── splash
│   │   │       │   ├── splash_module.dart
│   │   │       │   ├── splash_page.dart
│   │   │       │   └── splash_store.dart
│   │   │       └── start
│   │   │           ├── start_controller.dart
│   │   │           ├── start_module.dart
│   │   │           ├── start_page.dart
│   │   │           └── start_store.dart
│   │   └── modules.dart
│   ├── modules.iml
│   ├── pubspec.lock
│   └── pubspec.yaml
└── twittergb
    ├── Makefile
    ├── README.md
    ├── analysis_options.yaml
    ├── assets
    │   ├── icons
    │   │   └── icon.png
    │   └── images
    │       ├── camera.png
    │       ├── conversation.png
    │       ├── create-account.png
    │       ├── error.png
    │       ├── forgot-password.png
    │       ├── gallery.png
    │       ├── login.png
    │       ├── no-data.png
    │       ├── ok.png
    │       ├── post.png
    │       ├── profile-avatar.png
    │       └── profile.png
    ├── justfile
    ├── lib
    │   ├── app
    │   │   ├── app_controller.dart
    │   │   ├── app_module.dart
    │   │   ├── app_widget.dart
    │   │   └── theme
    │   │       ├── dark_theme.dart
    │   │       ├── light_theme.dart
    │   │       └── theme_colors.dart
    │   ├── firebase_options.dart
    │   ├── generated_plugin_registrant.dart
    │   ├── main.dart
    │   └── resources
    │       ├── icon.dart
    │       ├── images.dart
    │       └── resources.dart
    ├── pubspec.lock
    ├── pubspec.yaml
    ├── spider.yaml
    └── twittergb.iml

65 directories, 140 files
```
