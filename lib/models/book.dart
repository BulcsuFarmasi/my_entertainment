class Book {
  Book({
    required this.isbn,
    required this.author,
    required this.title,
    required this.publicationYear,
    this.basedOnTitle,
  });

  final int isbn;
  final String author;
  final String title;
  final int publicationYear;
  final String? basedOnTitle;
}
