import 'dart:ui';

import 'package:finebooks_app/models/book.dart';
import 'package:finebooks_app/screens/home/components/more_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';
import '../../theme/theme.dart';
import '../../blocs/search/search_bloc.dart';
import '../../blocs/search/search_state.dart';
import '../../blocs/search/search_events.dart';

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
          appBar: AppBar(
            primary: true,
            actions: [
              Container(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.white,
                  width: appWidth * 0.7,
                  height: appHeight * 0.05,
                  child: Row(
                    children: [
                      BlocProvider(
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
                                fixedSize:
                                    Size(appWidth * 0.7, appHeight * 0.05),
                                elevation: 0,
                                primary: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 100)
            ],
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
                              return MoreBottomSheet();
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
    var appWidth = mediaQuery.size.width;
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
