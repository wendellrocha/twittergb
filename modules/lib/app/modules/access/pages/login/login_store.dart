import 'package:asuka/asuka.dart' as asuka;
import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';

class LoginStore extends NotifierStore<LoginUserError, int> {
  final FirebaseAuthService _authService;

  LoginStore(this._authService) : super(0);

  Future<UserModel> submit(String email, String password) async {
    setLoading(true);
    final user = UserModel(email: email, password: password);
    final response = await _authService.login(user);
    return response.fold(
      (l) {
        setLoading(false);
        asuka.showDialog(
          builder: (context) => WarnModalWidget(
            title: 'Oooops!',
            text: l.message,
          ),
        );
        return const UserModel();
      },
      (user) {
        setLoading(false);
        return user;
      },
    );
  }

  Future<void> changePassword(String email) async {
    final result = await _authService.changePassword(email);
    return result.fold(
      (l) => asuka.showDialog(
        builder: (context) => WarnModalWidget(
          title: 'Ooops!',
          text: l.message,
        ),
      ),
      (r) => asuka.showDialog(
        builder: (context) => const WarnModalWidget(
          assetImage: 'assets/images/ok.png',
          title: 'Ok!',
          text: 'Foi enviado um link de recuperação'
              ' de senha no seu email cadastrado.',
        ),
      ),
    );
  }
}
