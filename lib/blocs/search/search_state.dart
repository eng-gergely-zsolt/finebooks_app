import '../../models/book.dart';
import '../../services/get/get_book_by_title_fragment.dart';

class SearchState {
  List<Book>? books;
  final String bookTitleFragment;

  SearchState({
    this.books,
    this.bookTitleFragment = '',
  });

  SearchState newSearchState({
    String? pBookTitleFragment,
  }) {
    return SearchState(
      books: this.books,
      bookTitleFragment: pBookTitleFragment ?? this.bookTitleFragment,
    );
  }

  List<Book> get getBooks {
    List<Book> result = [];

    if (this.books != null) {
      result = List.from(this.books!);
    }
    return result;
  }

  void searchBookByTitleFragment(String? pBookTitleFragment) {
    if (pBookTitleFragment != null) {
      Future<List<Book>> response =
          fetchBookByTitleFragment(pBookTitleFragment);

      response.then((value) {
        this.books = List.from(value);
      });
    }
  }
}
