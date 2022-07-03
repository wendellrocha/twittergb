import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';

import 'message_controller.dart';
import 'message_page.dart';
import 'message_store.dart';

class MessageModule extends Module {
  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => MessageStore()),
    Bind.lazySingleton((i) => MessageController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/' ':type',
      guards: [AuthGuard()],
      child: (_, args) => MessagePage(
        type: MessageType.values.singleWhere(
          (element) => element.name == args.params['type'],
          orElse: () => MessageType.create,
        ),
      ),
    ),
  ];
}
