import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/book_group.dart';
import '../../../models/reading.dart';
import '../widgets/book_group_preview.dart';

class BooksPage extends StatelessWidget {
  final Map<ReadingState, BookGroup> bookGroupsByReadingState;
  final Function addBook;
  final Function selectReadingState;

  BooksPage(this.bookGroupsByReadingState, this.addBook, this.selectReadingState);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Intl.message('Könyvek')),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...ReadingState.values.map((ReadingState readingState) {
                  return BookGroupPreview(
                    readingState: readingState,
                    bookGroup: bookGroupsByReadingState[readingState]!,
                    selectReadingState: selectReadingState,
                  );
                }),
                IconButton(icon: Icon(Icons.add), iconSize: 38, onPressed: () => addBook(true)),
              ],
            ),
          ),
        ));
  }
}
