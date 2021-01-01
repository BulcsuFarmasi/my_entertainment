class Book {
  Book({
    this.isbn,
    this.author,
    this.title,
    this.basedOnTitle,
    this.publicationYear,
    this.readingState,
  });

  final int isbn;
  final String author;
  final String title;
  final String basedOnTitle;
  final int publicationYear;
  final ReadingState readingState;
}

enum ReadingState { wantToRead, isReading, read }
