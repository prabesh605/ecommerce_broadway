abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginInvalid extends LoginState {
  final String message;
  LoginInvalid(this.message);
}
