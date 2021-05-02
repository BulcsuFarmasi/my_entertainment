import './person.dart';

class Book {
  Book({
    required this.isbn,
    required this.author,
    required this.title,
    required this.publicationYear,
    this.basedOnTitle,
  });

  final int isbn;
  final Person author;
  final String title;
  final int publicationYear;
  final String? basedOnTitle;
}
