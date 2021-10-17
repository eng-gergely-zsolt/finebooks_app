import 'dart:ui';

import 'package:finebooks_app/screens/friends/friends.dart';
import 'package:flutter/material.dart';

class MoreBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;
    var appHeight =
        mediaQuery.size.height - MediaQueryData.fromWindow(window).padding.top;
    return Column(
      children: [
        SizedBox(height: appHeight * 0.01),
        Container(
          height: 5,
          width: appWidth * 0.1,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
        SizedBox(height: appHeight * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  width: appWidth * 0.21,
                  height: appWidth * 0.21,
                  child: Icon(
                    Icons.person_outline,
                    size: appHeight * 0.07,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(238, 236, 230, 1),
                  ),
                ),
                SizedBox(height: appHeight * 0.01),
                Text(
                  'My profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Friends(),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    width: appWidth * 0.21,
                    height: appWidth * 0.21,
                    child: Icon(
                      Icons.group_outlined,
                      size: appHeight * 0.07,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(238, 236, 230, 1),
                    ),
                  ),
                  SizedBox(height: appHeight * 0.01),
                  Text(
                    'Friends',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: appWidth * 0.21,
                  height: appWidth * 0.21,
                  child: Icon(
                    Icons.groups_outlined,
                    size: appHeight * 0.07,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(238, 236, 230, 1),
                  ),
                ),
                SizedBox(height: appHeight * 0.01),
                Text(
                  'Groups',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: appHeight * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  width: appWidth * 0.21,
                  height: appWidth * 0.21,
                  child: Icon(
                    Icons.library_books_outlined,
                    size: appHeight * 0.07,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(238, 236, 230, 1),
                  ),
                ),
                SizedBox(height: appHeight * 0.01),
                Text(
                  'Reading',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Challenge',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: appWidth * 0.21,
                  height: appWidth * 0.21,
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: appHeight * 0.07,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(238, 236, 230, 1),
                  ),
                ),
                SizedBox(height: appHeight * 0.01),
                Text(
                  'Top picks',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'for you',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: appWidth * 0.21,
                  height: appWidth * 0.21,
                  child: Icon(
                    Icons.star_border,
                    size: appHeight * 0.07,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(238, 236, 230, 1),
                  ),
                ),
                SizedBox(height: appHeight * 0.01),
                Text(
                  'Best Books',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'of 2020',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: appHeight * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  width: appWidth * 0.21,
                  height: appWidth * 0.21,
                  child: Icon(
                    Icons.document_scanner_outlined,
                    size: appHeight * 0.07,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(238, 236, 230, 1),
                  ),
                ),
                SizedBox(height: appHeight * 0.01),
                Text(
                  'Scan books',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: appWidth * 0.21,
                  height: appWidth * 0.21,
                  child: Icon(
                    Icons.settings_outlined,
                    size: appHeight * 0.07,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(238, 236, 230, 1),
                  ),
                ),
                SizedBox(height: appHeight * 0.01),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: appWidth * 0.21,
                  height: appWidth * 0.21,
                  child: Icon(
                    Icons.help_outline,
                    size: appHeight * 0.07,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(238, 236, 230, 1),
                  ),
                ),
                SizedBox(height: appHeight * 0.01),
                Text(
                  'Help',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
