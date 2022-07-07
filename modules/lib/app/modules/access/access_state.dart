class AccessState {
  final bool hasAccount;
  final bool isFormValidated;

  AccessState(this.hasAccount, this.isFormValidated);

  @override
  String toString() => 'AccessState(hasAccount: $hasAccount,'
      ' isFormValidated: $isFormValidated)';
}
