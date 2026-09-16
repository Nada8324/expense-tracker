sealed class PasswordStates {}

class PasswordInit extends PasswordStates {}

class PasswordLoading extends PasswordStates {}

class PasswordSuccess extends PasswordStates {}

class PasswordFailer extends PasswordStates {
  final String error;

  PasswordFailer({required this.error});
}
