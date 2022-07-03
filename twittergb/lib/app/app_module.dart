import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:modules/modules.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UserStore()),
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
      module: SplashModule(),
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
