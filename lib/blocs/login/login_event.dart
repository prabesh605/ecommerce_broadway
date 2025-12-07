abstract class LoginEvent {}

class SubmitLogin extends LoginEvent {
  final String email;
  final String password;
  SubmitLogin(this.email, this.password);
}
