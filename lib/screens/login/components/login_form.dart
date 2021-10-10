import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/home.dart';
import '../../../models/user.dart';
import '../../../blocs/login/login_state.dart';
import '../../../blocs/login/login_block.dart';
import '../../../blocs/login/login_events.dart';

class LoginForm extends StatelessWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static TextEditingController usernameController = TextEditingController();

  void _validateLogin(BuildContext ctx, LoginState state) {
    Future<List<User>> userList =
        state.validateLogin(usernameController.value.text);

    userList.then((value) {
      if (formKey.currentState!.validate()) {
        Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => Home(value[0]),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;

    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 80),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: appWidth * 0.05),
                child: TextFormField(
                  controller: usernameController,
                  validator: (value) => state.validateUsername(),
                  onChanged: (value) => context
                      .read<LoginBloc>()
                      .add(ChangeInput(username: value)),
                  decoration: InputDecoration(
                    hintText: 'Username',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: appWidth * 0.05),
                child: TextFormField(
                  obscureText: true,
                  validator: (value) => state.validatePassword(),
                  onChanged: (value) => context
                      .read<LoginBloc>()
                      .add(ChangeInput(password: value)),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Sign In'),
                onPressed: () {
                  _validateLogin(context, state);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  fixedSize: Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
