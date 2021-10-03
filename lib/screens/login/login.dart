import 'package:flutter/material.dart';

import './components/login_view.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginView(),
      ),
    );
  }
}
