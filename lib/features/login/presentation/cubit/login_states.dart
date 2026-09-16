sealed class LoginStates {}

class LoginInit extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {}

class LoginFailer extends LoginStates {
  final String error;

  LoginFailer({required this.error});
}
