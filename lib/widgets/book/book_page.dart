import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_entertainment/widgets/book/book_group.dart';
import 'package:my_entertainment/widgets/book/book_list.dart';
import 'package:my_entertainment/widgets/book/new_book.dart';

import '../../models/book.dart';
import '../../models/reading.dart';

class BookPage extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: 'A tó úrnője',
      basedOnTitle: 'Pani Jeziora',
      isbn: 9789634069294,
      publicationYear: 1999,
      author: 'Andrzej Sapkowski',
      reading: Reading(ReadingState.isReading, currentPage: 70),
    ),
    Book(
      title: 'Fecske-torony',
      basedOnTitle: 'Wieża Jaskółki',
      isbn: 9789634069294,
      publicationYear: 199,
      author: 'Andrzej Sapkowski',
      reading: Reading(ReadingState.read),
    ),
    Book(
      title: 'Mi vagyunk a medvék',
      basedOnTitle: 'Björnstad',
      author: 'Fredrik Backman',
      publicationYear: 2016,
      isbn: 9789633245446,
      reading: Reading(ReadingState.wantToRead),
    ),
  ];

  Map<ReadingState, List<Book>> get bookGroups {
    Map<ReadingState, List<Book>> _bookGroups = {};
    books.forEach((Book book) {
      _bookGroups[book.reading.state] ??= [];
      _bookGroups[book.reading.state].add(book);
    });
    return _bookGroups;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            Intl.message('Könyvek'),
            style: Theme.of(context).textTheme.headline6,
          ),
          ...ReadingState.values.map((ReadingState readingState)  {
            return BookGroup(readingState: readingState, books: bookGroups[readingState],);
          }),
          NewBook(() {}),
        ],
      ),
    );
  }
}
