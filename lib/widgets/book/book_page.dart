import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/book.dart';
import '../../models/book_group.dart';
import '../../models/reading.dart';
import 'book_group_view.dart';
import 'new_book.dart';

class BookPage extends StatefulWidget {
  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  late List<Book> books;
  late List<Reading> readings;

  @override
  void initState() {
    super.initState();
    books = [
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
        isbn: 9789634069294,
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

    readings = [
      Reading(books[0], ReadingState.read),
      Reading(books[1], ReadingState.isReading, currentPage: 470),
      Reading(books[2], ReadingState.wantToRead),
    ];
  }

  Map<ReadingState, BookGroup> get bookGroupsByReadingState {
    Map<ReadingState, BookGroup> _bookGroupsByReadingState = {};

    readings.forEach((Reading reading) {
      _bookGroupsByReadingState[reading.state] ??= BookGroup(books: [], readings: []);
      _bookGroupsByReadingState[reading.state]!.readings.add(reading);
      _bookGroupsByReadingState[reading.state]!.books.add(reading.book);
    });

    return _bookGroupsByReadingState;
  }

  void addBook(Book book, Reading reading) {
    setState(() {
      books.add(book);
      readings.add(reading);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints contraints) {
      print(contraints.maxHeight);
      return SingleChildScrollView(
        child: Container(
          height: contraints.maxHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Intl.message('Könyvek'),
                style: Theme.of(context).textTheme.headline6,
              ),
              ...ReadingState.values.map((ReadingState readingState) {
                return BookGroupView(
                  readingState: readingState,
                  bookGroup: bookGroupsByReadingState[readingState]!,
                );
              }),
              Expanded(
                child: NewBook(addBook),
              ),
            ],
          ),
        ),
      );
    });
  }
}
