import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/book.dart';
import '../../../blocs/search/search_bloc.dart';
import '../../../blocs/search/search_state.dart';
import '../../../blocs/search/search_events.dart';
import '../../notification_center/notifocation_center.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final int loggedUserId;

  CustomAppbar(this.loggedUserId);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;
    var appHeight =
        mediaQuery.size.height - MediaQueryData.fromWindow(window).padding.top;

    return AppBar(
      primary: true,
      actions: [
        Container(
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            width: appWidth * 0.7,
            height: appHeight * 0.05,
            child: BlocProvider(
              create: (context) => SearchBloc(),
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return ElevatedButton(
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        SizedBox(width: appWidth * 0.02),
                        Text(
                          'Title, author, ISBN',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    onPressed: () => showSearch(
                      context: context,
                      delegate: DataSearch(context, state),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(appWidth * 0.7, appHeight * 0.05),
                      elevation: 0,
                      primary: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(width: appWidth * 0.12),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationCenter(loggedUserId),
              ),
            );
          },
          icon: Icon(Icons.notifications),
        ),
        SizedBox(width: appWidth * 0.04),
      ],
    );
  }
}

class DataSearch extends SearchDelegate {
  BuildContext ctx;
  SearchState state;

  DataSearch(this.ctx, this.state);

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leadin icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show some result based on the selection
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    var mediaQuery = MediaQuery.of(context);
    var appHeight = mediaQuery.size.height;
    ctx
        .read<SearchBloc>()
        .add(SearchBookByTitleFragment(bookTitleFragment: query));

    state.searchBookByTitleFragment(query);
    List<Book> mySuggestionList = List.from(state.getBooks);

    return ListView.builder(
      itemCount: mySuggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mySuggestionList[index].title as String,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'by ' + (mySuggestionList[index].author as String),
              style: TextStyle(fontSize: appHeight * 0.017),
            )
          ],
        ),
      ),
    );
  }
}
