import '../../models/reading.dart';

class BookRoutePath {
  int? selectedIsbn;
  ReadingState? selectedReadingState;
  bool isNew = false;

  BookRoutePath();

  BookRoutePath.isbn(this.selectedIsbn);

  BookRoutePath.readingState(this.selectedReadingState);

  BookRoutePath.isNew() : isNew = true;

  BookRoutePath.books();
}