import 'package:ecommerce_app/blocs/login/login_bloc.dart';
import 'package:ecommerce_app/blocs/login/login_event.dart';
import 'package:ecommerce_app/blocs/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              label: Text("Email"),
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              label: Text("Password"),
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final String email = emailController.text;
              final String password = passwordController.text;

              context.read<LoginBloc>().add(SubmitLogin(email, password));
            },
            child: Text("Login"),
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginSuccess) {
                return Text("Login Success");
              } else if (state is LoginInvalid) {
                return Text(state.message);
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
// event-
//state -
//bloc 