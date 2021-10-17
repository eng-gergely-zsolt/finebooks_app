import 'dart:convert';

import '../../models/user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUserByUsername(String username) async {
  String uri = '';

  if (username == '') {
    return [];
  } else {
    uri = 'https://10.0.2.2:5001/user' + '/$username';
  }

  final response = await http.get(Uri.parse(uri));

  if (response.statusCode == 200) {
    Iterable list = json.decode(response.body);
    return list.map((model) => User.fromJson(model)).toList();
  } else {
    throw Exception('Failed to load album');
  }

//   import 'dart:convert';

// import 'package:finebooks_app/models/person.dart';
// import 'package:http/http.dart' as http;

// Future<List<Person>> fetchPerson() async {
//   final response =
//       await http.get(Uri.parse('https://10.0.2.2:5001/person/anomakyr'));

//   if (response.statusCode == 200) {
//     Iterable list = json.decode(response.body);
//     List<Person> persons = list.map((model) => Person.fromJson(model)).toList();
//     return persons;
//   } else {
//     throw Exception('Failed to load album');
//   }

  // List<Person> persons = [];

  // await API.getUsers().then((response) {
  //   Iterable list = json.decode(response.body);
  //   persons = list.map((model) => Person.fromJson(model)).toList();
  //   print(persons[0].firstName);
  //   return persons;
  // });

  // if (response.statusCode == 200) {
  //   Iterable list = json.decode(response.body);
  //   persons =
  //       list.map((model) => Person.fromJson(model)) as Future<List<Person>>;
  //   return persons;
  // } else {
  //   // If the server did not return a 200 OK response,
  //   // then throw an exception.
  //   throw Exception('Failed to load album');
  // }
}

// class API {
//   static Future getUsers() {
//     return http.get((Uri.parse('https://10.0.2.2:5001/person/anomakyr')));
//   }
// }

// List<Person> getUsers() {
//   List<Person> persons = [];
//   API.getUsers().then((response) {
//     Iterable list = json.decode(response.body);
//     persons = list.map((model) => Person.fromJson(model)).toList();
//   });
//   return persons;
// }

// class LoginCall {}










// import 'dart:io';
// import 'dart:convert';

// import 'package:finebooks_app/models/person.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   HttpOverrides.global = new MyHttpOverrides();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   build(context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'My Http App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyListScreen(),
//     );
//   }
// }

// class MyListScreen extends StatefulWidget {
//   @override
//   createState() => _MyListScreenState();
// }

// class _MyListScreenState extends State {
//   List<Person> persons = [];

// _getUsers() {
//   API.getUsers().then((response) {
//     List<Person> persons = [];
//     setState(() {
//       Iterable list = json.decode(response.body);
//       persons = list.map((model) => Person.fromJson(model)).toList();
//     });
//   });
// }

// initState() {
//   super.initState();
//   _getUsers();
// }

// dispose() {
//   super.dispose();
// }

//   @override
//   build(context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("User List"),
//         ),
//         body: ListView.builder(
//           itemCount: persons.length,
//           itemBuilder: (context, index) {
//             return ListTile(title: Text(persons[index].username));
//           },
//         ));
//   }
// }

// class API {
//   static Future getUsers() {
//     return http.get((Uri.parse('https://10.0.2.2:5001/person')));
//   }
// }

