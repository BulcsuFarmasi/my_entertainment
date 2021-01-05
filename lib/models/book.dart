import './reading.dart';

class Book {
  Book({
    this.isbn,
    this.author,
    this.title,
    this.basedOnTitle,
    this.publicationYear,
    this.reading,
  });

  final int isbn;
  final String author;
  final String title;
  final String basedOnTitle;
  final int publicationYear;
  final Reading reading;
}


