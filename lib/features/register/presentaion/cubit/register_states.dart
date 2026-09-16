sealed class RegisterStates{}
class RegisterInitial extends RegisterStates{}
class RegisterLoading extends RegisterStates{}
class RegisterSuccess extends RegisterStates{}
class RegisterFailer extends RegisterStates{
  final String error;

  RegisterFailer({required this.error});
}
