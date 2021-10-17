class Book {
  final String? isbn;
  final String? title;
  final String? author;
  final String? publisher;

  Book({
    this.isbn,
    this.title,
    this.author,
    this.publisher,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      isbn: json['isbn'],
      title: json['title'],
      author: json['author'],
      publisher: json['publisher'],
    );
  }
}
