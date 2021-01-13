import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './book_list.dart';
import '../../models/book.dart';
import '../../models/reading.dart';

class BookGroup extends StatelessWidget {
  BookGroup({this.readingState, this.books});

  final ReadingState readingState;
  final List<Book> books;
  final Map<ReadingState, String> readingStateTranslations = {
    ReadingState.wantToRead: Intl.message('El akarom olvasni'),
    ReadingState.isReading: Intl.message('Jelenleg olvasott könyvek'),
    ReadingState.read: Intl.message('Elolvasott könyvek'),
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 350,
        child: Column(
          children: [
            Text(
              Intl.message(readingStateTranslations[readingState]),
              style: Theme.of(context).textTheme.headline6,
            ),
            BookList(books),
          ],
        ),
      ),
    );
  }
}
