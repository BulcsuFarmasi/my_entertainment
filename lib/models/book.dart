class Book {
  Book({
    required this.isbn,
    required this.author,
    required this.title,
    required this.basedOnTitle,
    required this.publicationYear,
  });

  final int isbn;
  final String author;
  final String title;
  final String basedOnTitle;
  final int publicationYear;
}
