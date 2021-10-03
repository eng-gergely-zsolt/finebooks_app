import 'package:finebooks_app/screens/login/components/other_login_options.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/images/books-cover3.jpg'),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LoginForm(),
                    OtherLoginOptions(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
