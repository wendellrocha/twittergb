import 'failure.dart';

const _errorCodes = <String, String>{
  'storage/unknown': 'Erro desconhecido. Por favor, tente novamente.',
  'storage/object-not-found': 'Não existe objeto com esta referência.'
      ' Entre em contato com o admistrador do sistema.',
  'storage/bucket-not-found':
      'Bucket não encontrado. Entre em contato com o admistrador do sistema.',
  'storage/project-not-found':
      'Projeto não encontrado. Entre em contato com o admistrador do sistema.',
  'storage/quota-exceeded':
      'Cota excedida. Entre em contato com o admistrador do sistema.',
  'storage/unauthenticated':
      'Usuário não autenticado. Por favor, faça o login e tente novamente.',
  'storage/unauthorized': 'Você não tem permissão para realizar esta'
      ' ação. Fale com o admistrador do sistema.',
  'storage/retry-limit-exceeded': 'O limite máximo da operação foi atingido.'
      ' Por favor, tente novamente mais tarde',
  'storage/invalid-checksum': 'O arquivo não recebido pelo servidor não é'
      ' o mesmo que foi enviado. Por favor, faça o upload novamente.',
  'storage/canceled': 'Operação cancelada pelo usuário.',
  'storage/invalid-event-name': 'Nome de evento inválido.',
  'storage/invalid-url': 'URL inválida.',
  'storage/invalid-argument': 'Argumento inválido.',
  'storage/no-default-bucket': 'Não há bucket padrão configurado. Por favor,'
      ' entre em contato com o administrador do sistema.',
  'storage/cannot-slice-blob':
      'Arquivo alterado durante a operação. Por favor, tente novamente.',
  'storage/server-file-wrong-size': 'O arquivo não recebido pelo servidor não é'
      ' o mesmo que foi enviado. Por favor, faça o upload novamente.',
};

class StorageError implements Failure {
  @override
  final String message;
  final String errorCode;

  StorageError({required this.errorCode, required this.message});

  factory StorageError.fromCode(String errorCode) {
    if (_errorCodes.containsKey(errorCode)) {
      return StorageError(
        errorCode: errorCode,
        message: _errorCodes[errorCode]!,
      );
    }

    return StorageError(
      errorCode: errorCode,
      message:
          'Não foi possível realizar a operação no momento. Por favor, tente novamente.',
    );
  }
}
