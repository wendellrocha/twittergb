import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:modules/modules.dart';

import '../resources/resources.dart';
import 'app_controller.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UserStore()),
    Bind.lazySingleton((i) => AppController(i(), i())),
    Bind.lazySingleton<FirebaseAuth>((i) => FirebaseAuth.instance),
    Bind.lazySingleton<FirebaseStorage>((i) => FirebaseStorage.instance),
    Bind.lazySingleton<FirebaseFirestore>((i) => FirebaseFirestore.instance),
    Bind.lazySingleton((i) => FirebaseAuthService(i<FirebaseAuth>())),
    Bind.lazySingleton((i) => FirebaseStorageService(i<FirebaseStorage>())),
    Bind.lazySingleton((i) => FirebaseFirestoreService(i<FirebaseFirestore>())),
    Bind.factory((i) => TextFieldStore()),
    Bind.lazySingleton<Dio>((i) => Dio()),
    Bind.lazySingleton<DioInterceptor>((i) => DioInterceptor()),
    Bind.lazySingleton<IHttpClientAdapter>(
      (i) => DioAdapter(
        dio: i(),
        interceptors: [
          i<DioInterceptor>(),
        ],
      ),
    ),
    AsyncBind<SharedPreferencesService>(
      (_) => SharedPreferencesService.getInstance(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      '/',
      module: SplashModule(splashIcon: Icon.icon),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/start',
      module: StartModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/message',
      module: MessageModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/access',
      module: AccessModule(),
      transition: TransitionType.fadeIn,
    )
  ];
}
