import 'package:flutter/services.dart';

class Validators {
  static final RegExp regex = RegExp('[^0-9]');
  static final RegExp regexOnlyLetters = RegExp(r'[a-z+\s+\b|\b\s+A-Z]');
  static final RegExp regexRepeatingNumbers = RegExp(
    r'(^0+$)|(^1+$)|(^2+$)|(^3+$)|(^4+$)|(^5+$)|(^6+$)|(^7+$)|(^8+$)|(^9+$)',
  );
  static final RegExp regexRepeatingPeriods = RegExp(
    r'(\d)\0{5}|(\d)\1{5}|(\d)\2{5}'
    '|(d)3{5}|(d)4{5}(d)5{5}|'
    '(d)6{5}(d)7{5}|(d)8{5}|(d)9{5}',
  );

  static final FilteringTextInputFormatter onlyLetters =
      FilteringTextInputFormatter.allow(regexOnlyLetters);
  static final FilteringTextInputFormatter onlyNumbers =
      FilteringTextInputFormatter.allow(regex);

  static limit(int limit) {
    return LengthLimitingTextInputFormatter(limit);
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite o nome completo';
    }

    if (value.split(' ').length < 2) {
      return 'Por favor, digite seu nome completo. Ex: Joana Silva';
    }

    if (validateSpecialCase(value)) {
      return 'Por favor, remova os caracteres especiais do nome.';
    }

    if (value.contains(RegExp('[0-9]'))) {
      return 'Por favor, remova os números do nome.';
    }

    return null;
  }

  static String? isNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }

    if (validateSpecialCase(value)) {
      return 'Por favor, remova os caracteres especiais.';
    }

    return null;
  }

  static String? customMessage(String? value, {required String message}) {
    if (value == null || value.isEmpty) {
      return message;
    }

    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'E-mail inválido';
    }

    if (validateSpecialCaseEmail(value)) {
      return 'Por favor, remova os caracteres especiais do email.';
    }

    if (!_isValidEmail(value)) {
      return 'Ex: nome@email.com';
    }

    return null;
  }

  static String? compareEmails(String? value, String email) {
    if (value == null || value.isEmpty) {
      return 'E-mail inválido';
    }

    if (!_isValidEmail(value)) {
      return 'Ex: nome@email.com';
    }

    if (value != email) {
      return 'Os e-mails não correspondem';
    }

    if (value == email) {
      return null;
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite a senha';
    }

    if (!_isValidPassword(value)) {
      return 'A senha não corresponde aos requesitos.';
    }

    return null;
  }

  static String? passwordEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite a senha';
    }

    return null;
  }

  static String? comparePasswords(String? pass, String? confirm) {
    if (confirm == null || pass == null || confirm.isEmpty || pass.isEmpty) {
      return 'As senhas não correspondem.';
    }

    if (pass != confirm) {
      return 'As senhas não correspondem.';
    }

    return null;
  }

  static bool _isValidEmail(String value) {
    return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(value);
  }

  static bool validateUpperCase(String value) {
    String pattern = r'[A-Z]';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validateLowerCase(String value) {
    String pattern = r'[a-z]';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validateDigitCase(String value) {
    String pattern = r'[0-9]';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validateSpecialCase(String value) {
    String pattern = r'[!@#\$&*~]';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validateSpecialCaseEmail(String value) {
    String pattern = r'[!#\$&*~]';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validateLength(String value) {
    final digits = validateDigitCase(value);
    final upper = validateUpperCase(value);
    return digits && upper && value.length >= 8 ? true : false;
  }

  static bool validateSpace(String value) {
    String pattern = r'([ ])';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool _isValidPassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value) && !validateSpace(value);
  }

  static bool validateRepeatingNumbers(String value) {
    return regexRepeatingNumbers.hasMatch(value);
  }

  static bool validateRepeatingPeriods(String value) {
    return regexRepeatingPeriods.hasMatch(value);
  }
}
