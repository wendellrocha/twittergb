import 'failure.dart';

const _errorCodes = <String, String>{
  'email-already-in-use': 'Email já cadastrado.',
  'invalid-email':
      'Email inválido. Por favor, verifique o email e tente novamente.',
  'weak-password': 'Senha fraca. A senha deve'
      ' conter no mínimo 8 caracteres entre letras,'
      ' números e caracteres especiais (@#\$%&*-_+=)',
  'user-disabled': 'Usuário desabilitado. Entre em contato com'
      ' o administrador do sistema.',
  'user-not-found': 'Usuário não cadastrado.',
  'wrong-password': 'Senha inválida.'
};

class CreateUserError extends Failure {
  @override
  final String message;
  final String errorCode;

  CreateUserError({required this.errorCode, required this.message});

  factory CreateUserError.fromCode(String errorCode) {
    if (_errorCodes.containsKey(errorCode)) {
      return CreateUserError(
        errorCode: errorCode,
        message: _errorCodes[errorCode]!,
      );
    }

    return CreateUserError(
      errorCode: errorCode,
      message: 'Não foi possível criar a sua conta no momento'
          '. Por favor, tente novamente.',
    );
  }
}

class LoginUserError extends Failure {
  @override
  final String message;
  final String errorCode;

  LoginUserError({required this.errorCode, required this.message});

  factory LoginUserError.fromCode(String errorCode) {
    if (_errorCodes.containsKey(errorCode)) {
      return LoginUserError(
        errorCode: errorCode,
        message: _errorCodes[errorCode]!,
      );
    }

    return LoginUserError(
      errorCode: errorCode,
      message: 'Não foi possível realizar o login no momento.'
          ' Por favor, tente novamente.',
    );
  }
}

class ChangePasswordError extends Failure {
  @override
  final String message;
  final String errorCode;

  ChangePasswordError({required this.errorCode, required this.message});

  factory ChangePasswordError.fromCode(String errorCode) {
    if (_errorCodes.containsKey(errorCode)) {
      return ChangePasswordError(
        errorCode: errorCode,
        message: _errorCodes[errorCode]!,
      );
    }

    return ChangePasswordError(
      errorCode: errorCode,
      message: 'Não foi possível realizar o login no momento.'
          ' Por favor, tente novamente.',
    );
  }
}
