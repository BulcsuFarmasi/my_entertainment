import '../../models/book.dart';
import '../../models/book_group.dart';
import '../../models/reading.dart';

class BookState {
  BookState() {
    readings = [
      Reading(books[0], ReadingState.read),
      Reading(books[1], ReadingState.isReading, currentPage: 470),
      Reading(books[2], ReadingState.wantToRead),
    ];
  }

  bool adding = false;

  Reading? selectedReading;

  ReadingState? selectedReadingState;

  List<Book> books = [
    Book(
      title: 'A tó úrnője',
      basedOnTitle: 'Pani Jeziora',
      isbn: 9789634069294,
      publicationYear: 1999,
      author: 'Andrzej Sapkowski',
    ),
    Book(
      title: 'Fecske-torony',
      basedOnTitle: 'Wieża Jaskółki',
      isbn: 9789634069287,
      publicationYear: 1999,
      author: 'Andrzej Sapkowski',
    ),
    Book(
      title: 'Mi vagyunk a medvék',
      basedOnTitle: 'Björnstad',
      author: 'Fredrik Backman',
      publicationYear: 2016,
      isbn: 9789633245446,
    ),
  ];


  List<Reading>? readings;



  Map<ReadingState, BookGroup> get bookGroupsByReadingState {
    Map<ReadingState, BookGroup> _bookGroupsByReadingState = {};

    readings!.forEach((Reading reading) {
      _bookGroupsByReadingState[reading.state] ??= BookGroup(books: [], readings: []);
      _bookGroupsByReadingState[reading.state]!.readings.add(reading);
      _bookGroupsByReadingState[reading.state]!.books.add(reading.book);
    });

    return _bookGroupsByReadingState;
  }

  void addBook(Book book, Reading reading) {
    books.add(book);
    readings!.add(reading);
  }

  void selectReading (Reading? reading) {
    selectedReading = reading;
  }

  void selectReadingState(ReadingState? readingState) {
    selectedReadingState = readingState;
  }

  void setAdding(bool newAdding) {
    adding = newAdding;
  }
}
