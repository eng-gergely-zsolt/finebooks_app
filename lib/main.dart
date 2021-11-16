import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './models/user.dart';
import '../screens/home/home.dart';

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final User user = User(
    id: 1,
    image: '',
    password: '123',
    email: 'anomakyr@gmail.com',
    username: 'anomakyr',
    lastName: 'Gergely',
    firstName: 'Zsolt',
  );

  @override
  build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Home(user),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// FutureBuilder<Person>(
              //     future: state.validateLogin(),
              //     builder:
              //         (BuildContext context, AsyncSnapshot<Person> snapshot) {
              //       return snapshot.data != null
              //           ? Text(snapshot.data!.firstName)
              //           : Text('fasz');
              //     }),


// var mediaQuery = MediaQuery.of(context);
// var appWidth = mediaQuery.size.width;
// var appHeight = mediaQuery.size.height - MediaQueryData.fromWindow(window).padding.top;