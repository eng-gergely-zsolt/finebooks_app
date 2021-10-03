import 'package:flutter/material.dart';

class OtherLoginOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text('Forgot password?'),
        SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.facebook,
              color: Colors.blue,
            ),
            SizedBox(width: 10),
            Text(
              'Sign In',
              style: TextStyle(
                color: Colors.brown,
              ),
            ),
            SizedBox(width: 40),
            Container(
              width: 20,
              height: 20,
              child: Image.asset('assets/images/google-logo.png'),
            ),
            SizedBox(width: 10),
            Text(
              'Sign In',
              style: TextStyle(
                color: Colors.brown,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t have an account?'),
            TextButton(
              onPressed: () {},
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.brown,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
