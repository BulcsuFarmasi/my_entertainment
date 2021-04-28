import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/book_group.dart';
import '../../../models/reading.dart';
import '../widgets/book_group_preview.dart';

class BooksPage extends StatelessWidget {
  final Map<ReadingState, BookGroup> bookGroupsByReadingState;
  final Function addBook;

  BooksPage(this.bookGroupsByReadingState, this.addBook);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Intl.message('Könyvek')),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Intl.message('Könyvek'),
                  style: Theme.of(context).textTheme.headline6,
                ),
                ...ReadingState.values.map((ReadingState readingState) {
                  return BookGroupPreview(
                    readingState: readingState,
                    bookGroup: bookGroupsByReadingState[readingState]!,
                  );
                }),
                IconButton(icon: Icon(Icons.add), onPressed: () => addBook(true)),
              ],
            ),
          ),
        ));
  }
}
