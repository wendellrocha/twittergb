class CreateAccountFormState {
  final String name;
  final String email;
  final String password;

  const CreateAccountFormState({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  String toString() =>
      'LoginFormState(name: $name, email: $email, password: $password)';
}
