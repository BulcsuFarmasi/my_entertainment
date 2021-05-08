import '../../models/book.dart';
import '../../models/book_group.dart';
import '../../models/person.dart';
import '../../models/reading.dart';

class BookState {
  BookState() {
    readings = [
      Reading(books[0], ReadingState.read),
      Reading(books[1], ReadingState.isReading, currentPage: 248),
      Reading(books[2], ReadingState.wantToRead),
    ];
  }

  bool adding = false;

  Reading? selectedReading;

  ReadingState? selectedReadingState;

  List<Book> books = [
    Book(
      title: 'Artemis',
      basedOnTitle: 'Artemis',
      isbn: 9789634700081,
      publicationYear: 2017,
      author: Person('Andy Weir'),
    ),
    Book(
      title: 'Zavaros vér',
      basedOnTitle: 'Troubled Blood',
      isbn: 9789635660681,
      publicationYear: 2020,
      author: Person('Robert Galbraith'),
    ),
    Book(
      title: 'Mi vagyunk a medvék',
      basedOnTitle: 'Björnstad',
      author: Person('Fredrik Backman'),
      publicationYear: 2016,
      isbn: 9789633245446,
    ),
  ];

  List<Reading>? readings;

  Map<ReadingState, BookGroup> get bookGroupsByReadingState {
    Map<ReadingState, BookGroup> _bookGroupsByReadingState = {
      ReadingState.read: BookGroup(books: [], readings: []),
      ReadingState.isReading: BookGroup(books: [], readings: []),
      ReadingState.wantToRead: BookGroup(books: [], readings: []),
    };

    readings!.forEach((Reading reading) {
      _bookGroupsByReadingState[reading.state]!.readings.add(reading);
      _bookGroupsByReadingState[reading.state]!.books.add(reading.book);
    });

    return _bookGroupsByReadingState;
  }

  void addBook(Book book, Reading reading) {
    books.add(book);
    readings!.add(reading);
  }

  void selectReading(Reading? reading) {
    selectedReading = reading;
  }

  void selectReadingState(ReadingState? readingState) {
    selectedReadingState = readingState;
  }

  void setAdding(bool newAdding) {
    adding = newAdding;
  }
}
