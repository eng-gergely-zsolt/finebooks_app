import 'package:finebooks_app/blocs/search/search_events.dart';
import 'package:finebooks_app/blocs/search/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    //Search book by title fragment
    if (event is SearchBookByTitleFragment) {
      yield state.newSearchState(pBookTitleFragment: event.bookTitleFragment);
    }
  }
}
