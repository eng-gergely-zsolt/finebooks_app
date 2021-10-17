abstract class SearchEvent {}

class SearchBookByTitleFragment extends SearchEvent {
  final String? bookTitleFragment;
  SearchBookByTitleFragment({this.bookTitleFragment});
}
