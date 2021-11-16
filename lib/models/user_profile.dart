import 'package:flutter/material.dart';

import './relationship.dart';

class UserProfile {
  bool areTheyFriends = false;
  NetworkImage image = NetworkImage('');
  List<Relationship> relationships = [];
}
