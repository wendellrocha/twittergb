import 'package:asuka/asuka.dart' as asuka;
import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';

import 'states/create_account_form_state.dart';

class CreateAccountStore extends NotifierStore<CreateUserError, int> {
  final FirebaseAuthService _authService;
  CreateAccountStore(this._authService) : super(0);

  Future<UserModel> submit(CreateAccountFormState state) async {
    setLoading(true);
    final user = UserModel(
      name: state.name,
      email: state.email,
      password: state.password,
    );

    final result = await _authService.createAccount(user);
    return result.fold(
      (l) {
        setLoading(false);
        asuka.showDialog(
          builder: (context) => WarnModalWidget(
            title: 'Ooops!',
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
}
