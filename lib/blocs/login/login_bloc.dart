import 'package:ecommerce_app/blocs/login/login_event.dart';
import 'package:ecommerce_app/blocs/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SubmitLogin>((event, emit) {
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(LoginInvalid("Email Or Password incorrect"));
      } else {
        emit(LoginSuccess());
      }
    });
  }
}
