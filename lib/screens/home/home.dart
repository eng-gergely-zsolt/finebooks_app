import 'dart:ui';

import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../theme/theme.dart';
import './components/more_bottom_sheet.dart';
import 'components/custom_appbar.dart';

class Home extends StatelessWidget {
  final User user;

  Home(this.user);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;
    var appHeight =
        mediaQuery.size.height - MediaQueryData.fromWindow(window).padding.top;

    return MaterialApp(
      theme: CustomTheme.lightTheme,
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(appHeight * 0.07),
            child: CustomAppbar(user.id),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: appHeight * 0.07,
              child: Material(
                color: Color.fromRGBO(238, 236, 230, 1),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.black12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_outlined,
                            size: appWidth * 0.07,
                          ),
                          Text('Home'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.black12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book_outlined,
                            size: appWidth * 0.07,
                          ),
                          Text('My Books'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.black12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.find_in_page_outlined,
                            size: appWidth * 0.07,
                          ),
                          Text('Discover'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.black12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            size: appWidth * 0.07,
                          ),
                          Text('Search'),
                        ],
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.black12,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return MoreBottomSheet(user);
                            });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.menu,
                            size: appWidth * 0.07,
                          ),
                          Text('More'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
